Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 424EA7DDC4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:50:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4F9okJT003747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 02:50:46 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 02:50:45 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
Date: Wed, 15 May 2019 17:50:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2019 09:50:48 -0000
Content-Type: multipart/alternative;
	boundary="------------A29464203F2034C1FAC722DB"
Content-Language: en-US

--------------A29464203F2034C1FAC722DB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 5/15/19 5:32 PM, Andreas Müller wrote:
>> --- a/meta/classes/autotools.bbclass
>> +++ b/meta/classes/autotools.bbclass
>> @@ -90,7 +90,11 @@ oe_runconf () {
>>                  bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
>>                  if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
>>                          bbnote "The following config.log files may provide further information."
>> -                       bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
>> +                       config_log="`find ${B} -ignore_readdir_race -type f -name config.log`"
>> +                       bbnote "$config_log"
>> +                       [ -e "$config_log" ] && cat "$config_log" | while read line; do
>> +                               bbnote "$line"
>> +                       done
>>                          bbfatal_log "configure failed"
>>                  fi
>>          else
>> --
>> 2.7.4
>>
> That output is useful only sometimes and extremly verbose. I'd suggest
> to introduce a switch to enable/disable (even as newbie user I am able
> to find config.log). How about making autobuilder's WORKDIR
> accessible?

The output only happens while do_configure failure, it does nothing when 
build succeed,

while failure occurs, I believe related message is the more the better.

The autobuilder is just an example, for community development, it is 
hard to login

others build host to debug issue, and we have to take time to reproduce it

if we could trace it with a simple glance from the log, why not


//Hongxu


> Andreas



--------------A29464203F2034C1FAC722DB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 5/15/19 5:32 PM, Andreas Müller
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com">
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -90,7 +90,11 @@ oe_runconf () {
                bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
                if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
                        bbnote "The following config.log files may provide further information."
-                       bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
+                       config_log="`find ${B} -ignore_readdir_race -type f -name config.log`"
+                       bbnote "$config_log"
+                       [ -e "$config_log" ] &amp;&amp; cat "$config_log" | while read line; do
+                               bbnote "$line"
+                       done
                        bbfatal_log "configure failed"
                fi
        else
--
2.7.4

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">That output is useful only sometimes and extremly verbose. I'd suggest
to introduce a switch to enable/disable (even as newbie user I am able
to find config.log). How about making autobuilder's WORKDIR
accessible?
</pre>
    </blockquote>
    <p>The output only happens while do_configure failure, it does
      nothing when build succeed,<br>
    </p>
    <p>while failure occurs, I believe related message is the more the
      better.</p>
    <p>The autobuilder is just an example, for community development, it
      is hard to login</p>
    <p>others build host to debug issue, and we have to take time to
      reproduce it<br>
    </p>
    <p>if we could trace it with a simple glance from the log, why not<br>
    </p>
    <p><br>
    </p>
    <p>//Hongxu<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
Andreas
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------A29464203F2034C1FAC722DB--
