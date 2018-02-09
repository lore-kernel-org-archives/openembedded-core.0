Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7B57827F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 07:45:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w197jpnH020613
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Feb 2018 23:45:51 -0800
Received: from [128.224.163.244] (128.224.163.244) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 8 Feb 2018 23:45:44 -0800
To: "Burton, Ross" <ross.burton@intel.com>, Randy MacLeod
	<randy.macleod@windriver.com>
References: <cover.1515461823.git.Qi.Chen@windriver.com>
	<a320979ef8fb138981c66b8c0ead607a9804cee0.1515461823.git.Qi.Chen@windriver.com>
	<CAJTo0LayZCc=psjBv7QjsXNi3drktBT4wmZcXd37cVGHYbAJcg@mail.gmail.com>
	<5377d8ea-0b83-a972-eece-a0dbd3129f31@windriver.com>
	<CAJTo0LanxcbSTOatAxbD_hn6meS1Rwkvjug_+DPryMUcW1nAQA@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <21871d83-7fb7-3576-387e-d66bdbcf5473@windriver.com>
Date: Fri, 9 Feb 2018 15:48:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LanxcbSTOatAxbD_hn6meS1Rwkvjug_+DPryMUcW1nAQA@mail.gmail.com>
X-Originating-IP: [128.224.163.244]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] coreutils: upgrade to 8.29
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
X-List-Received-Date: Fri, 09 Feb 2018 07:45:51 -0000
Content-Type: multipart/alternative;
	boundary="------------F5C3505EB5E3C988AAAEEA80"

--------------F5C3505EB5E3C988AAAEEA80
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/19/2018 01:34 AM, Burton, Ross wrote:
> On 18 January 2018 at 16:47, Randy MacLeod 
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote:
>
>     On 2018-01-11 11:18 AM, Burton, Ross wrote:
>
>         On 9 January 2018 at 01:40, Chen Qi <Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com> <mailto:Qi.Chen@windriver.com
>         <mailto:Qi.Chen@windriver.com>>> wrote:
>
>             * hostname is explicitly enabled to keep the same with
>         previous recipe's
>                behaviour.
>
>
>         But buildhistory-diff:
>
>         packages/corei7-64-poky-linux/coreutils/coreutils: FILELIST:
>         added "/usr/bin/hostname"
>
>         So the old coreutils wasn't building hostname at all (we use
>         /bin/hostname from busybox).
>
>     Are you asking Chen to package coreutils.hostname and
>     use the alternatives mechanism with busybox's hostname as the default?
>     (busybox hostname has annoyed me in a past life!)
>
>
> I'm not sure what I'm asking, just pointing out that the log is wrong 
> as the old coreutils wasn't building a hostname binary.
>
> If someone sets base_bindir and bindir to the same directory then 
> there will be a conflict, so this does need to be sorted somehow.
>
> Ross

Hi Ross,

You are right about this. The old coreutils doesn't build out hostname. 
I cannot recall why I thought it did. Anyway I can see from this mistake 
that using buildhistory is indeed a big help, and I'll use it in my 
future work.

I've sent out a fix to resolve the conflict problem about hostname 
between coreutils and other packages (busybox and net-tools).

Best Regards,
Chen Qi



--------------F5C3505EB5E3C988AAAEEA80
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 01/19/2018 01:34 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LanxcbSTOatAxbD_hn6meS1Rwkvjug_+DPryMUcW1nAQA@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">On 18 January 2018 at 16:47, Randy MacLeod <span
          dir="ltr">&lt;<a moz-do-not-send="true"
            href="mailto:randy.macleod@windriver.com" target="_blank">randy.macleod@windriver.com</a>&gt;</span>
        wrote:<br>
        <div class="gmail_extra">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">On
              2018-01-11 11:18 AM, Burton, Ross wrote:<span class=""><br>
                <blockquote class="gmail_quote" style="margin:0 0 0
                  .8ex;border-left:1px #ccc solid;padding-left:1ex">
                  On 9 January 2018 at 01:40, Chen Qi &lt;<a
                    moz-do-not-send="true"
                    href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>
                  &lt;mailto:<a moz-do-not-send="true"
                    href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<wbr>&gt;
                  wrote:<br>
                  <br>
                      * hostname is explicitly enabled to keep the same
                  with previous recipe's<br>
                         behaviour.<br>
                  <br>
                  <br>
                  But buildhistory-diff:<br>
                  <br>
                  packages/corei7-64-poky-linux/<wbr>coreutils/coreutils:
                  FILELIST: added "/usr/bin/hostname"<br>
                  <br>
                  So the old coreutils wasn't building hostname at all
                  (we use /bin/hostname from busybox).<br>
                </blockquote>
              </span></blockquote>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Are you
              asking Chen to package coreutils.hostname and<br>
              use the alternatives mechanism with busybox's hostname as
              the default?<br>
              (busybox hostname has annoyed me in a past life!)<br>
            </blockquote>
            <div><br>
            </div>
            <div>I'm not sure what I'm asking, just pointing out that
              the log is wrong as the old coreutils wasn't building a
              hostname binary.</div>
            <div><br>
            </div>
            <div>If someone sets base_bindir and bindir to the same
              directory then there will be a conflict, so this does need
              to be sorted somehow.</div>
            <div><br>
            </div>
            <div>Ross </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Hi Ross,<br>
    <br>
    You are right about this. The old coreutils doesn't build out
    hostname. I cannot recall why I thought it did. Anyway I can see
    from this mistake that using buildhistory is indeed a big help, and
    I'll use it in my future work.<br>
    <br>
    I've sent out a fix to resolve the conflict problem about hostname
    between coreutils and other packages (busybox and net-tools).<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <p><br>
    </p>
  </body>
</html>

--------------F5C3505EB5E3C988AAAEEA80--
