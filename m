Return-Path: <Haitao.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AED027C6AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:19:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1M8ISLH029393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 Feb 2019 00:18:49 -0800
Received: from localhost.localdomain (128.224.162.215) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.435.0; Fri, 22 Feb 2019 00:18:30 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1550815380-192596-1-git-send-email-haitao.liu@windriver.com>
	<939bc06d030a91fc7f2376171997fdd010124b5d.camel@linuxfoundation.org>
From: Haitaoliu <Haitao.Liu@windriver.com>
Message-ID: <fcde04af-b11c-c6a1-96a8-e392f6433cc9@windriver.com>
Date: Fri, 22 Feb 2019 16:15:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <939bc06d030a91fc7f2376171997fdd010124b5d.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.215]
Subject: Re: [PATCH] bitbake.conf:update FETCHCMD_wget with --no-passive-ftp
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
X-List-Received-Date: Fri, 22 Feb 2019 08:19:15 -0000
Content-Type: multipart/alternative;
	boundary="------------F44D801B8FA93C1E83C75A35"
Content-Language: en-US

--------------F44D801B8FA93C1E83C75A35
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2019/2/22 下午3:17, Richard Purdie wrote:
> On Fri, 2019-02-22 at 14:03 +0800, Liu Haitao wrote:
>> When fetching the source of alsa it would trigger the following
>> WARNING:
>>
>>> WARNING: alsa-lib-1.1.6-r0 do_fetch: Failed to fetch URL
>>> ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.6.tar.bz2,
>>> attempting MIRRORS if
>>> available
>> Bitbake would use wget with "--no-passive" to fetch the source.
>> Behind most firewall and NAT
>> configurations it could work well.However, in some rare firewall
>> configurations,
>> active FTP actually works when passive FTP doesn't.
>>
>> So disable the use of the passive FTP transfer mode for wget.
> As you say, its much more likely that passive ftp would work than
> active ftp, so this change would make things worse for more people?
>
This change maybe make some trouble for others. But I have not found any 
errors  since  applying the change into the latest yocto.

Each of two mode(active and passive) has its own advantages and 
disadvantages.  Now most servers and firewalls support passive ftp,

  while the ALSA is an exception that does not support it.

> We're trying to get away from having ftp urls in oe-core at all so
> hopefully this isn't a big deal.

Thanks for your reminding, I could  try to use https url instead of ftp 
url in alsa-lib_1.1.6.bb.  The alsa also provides the HTTP server for 
downing the packages. 
"https://www.alsa-project.org/files/pub/lib/alsa-lib-1.1.6.tar.bz2"

thanks,

haitao

> Cheers,
>
> Richard
>
>

--------------F44D801B8FA93C1E83C75A35
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2019/2/22 下午3:17, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:939bc06d030a91fc7f2376171997fdd010124b5d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">On Fri, 2019-02-22 at 14:03 +0800, Liu Haitao wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">When fetching the source of alsa it would trigger the following
WARNING:

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">WARNING: alsa-lib-1.1.6-r0 do_fetch: Failed to fetch URL
<a class="moz-txt-link-freetext" href="ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.6.tar.bz2">ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.6.tar.bz2</a>,
attempting MIRRORS if
available
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Bitbake would use wget with "--no-passive" to fetch the source.
Behind most firewall and NAT
configurations it could work well.However, in some rare firewall
configurations,
active FTP actually works when passive FTP doesn't.

So disable the use of the passive FTP transfer mode for wget.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As you say, its much more likely that passive ftp would work than
active ftp, so this change would make things worse for more people?

</pre>
    </blockquote>
    <p><span><span><span>This change maybe make some trouble for others.
            But I have not found any errors  since  applying the change
            into the latest yocto.<br>
          </span></span></span></p>
    <p><span> </span><span><span>Each of two mode(active and passive)
          has its own </span><span id="tran_2_5" class=""></span><span></span><span
          id="tran_2_6" class=""></span><span>advantages and
          disadvantages</span><span>.  Now most servers and firewalls
          support passive ftp,</span></span></p>
    <p><span><span> while the ALSA is an exception that does not support
          it. <br>
        </span></span></p>
    <p><span><span></span></span></p>
    <blockquote type="cite"
cite="mid:939bc06d030a91fc7f2376171997fdd010124b5d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
We're trying to get away from having ftp urls in oe-core at all so
hopefully this isn't a big deal.
</pre>
    </blockquote>
    <p>Thanks for your reminding, I could  try to use https url instead
      of ftp url in alsa-lib_1.1.6.bb.  The alsa also provides the HTTP
      server for downing the packages. 
      <a class="moz-txt-link-rfc2396E" href="https://www.alsa-project.org/files/pub/lib/alsa-lib-1.1.6.tar.bz2">"https://www.alsa-project.org/files/pub/lib/alsa-lib-1.1.6.tar.bz2"</a>
      <br>
    </p>
    <p>thanks,</p>
    <p>haitao<br>
    </p>
    <blockquote type="cite"
cite="mid:939bc06d030a91fc7f2376171997fdd010124b5d.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">
Cheers,

Richard


</pre>
    </blockquote>
  </body>
</html>

--------------F44D801B8FA93C1E83C75A35--
