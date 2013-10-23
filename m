Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 31B266D2BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 11:27:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,553,1378828800"; d="scan'208,217";a="8839285"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 23 Oct 2013 19:23:43 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r9NBR2IX001857;
	Wed, 23 Oct 2013 19:27:02 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013102319243217-2482226 ;
	Wed, 23 Oct 2013 19:24:32 +0800 
Message-ID: <5267B286.3050603@cn.fujitsu.com>
Date: Wed, 23 Oct 2013 19:27:02 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: Yevhen Kyriukha <kirgene@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CADV-EXHtc2EVTwHhaxGdm3bxmm_uNf2RN4ZinDgZU0mhF=P2vg@mail.gmail.com>
In-Reply-To: <CADV-EXHtc2EVTwHhaxGdm3bxmm_uNf2RN4ZinDgZU0mhF=P2vg@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/10/23 19:24:32,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/10/23 19:24:32,
	Serialize complete at 2013/10/23 19:24:32
Subject: Re: [PATCH] systemd.bbclass: do not call 'systemctl restart ${SYSTEMD_SERVICE}' at systemd_postinst
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
X-List-Received-Date: Wed, 23 Oct 2013 11:27:05 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset=ISO-8859-1

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">Hi Yevhen,<br>
      <br>
      Well...<br>
      This bug seems different from mine.<br>
      <br>
      I build from yocto-1.4.2(had accepted this patch),&nbsp; and bitbake
      core-image-sato<br>
      In my case,&nbsp; when do_roofs,&nbsp; I make util-linux-uuidd_postinst(add
      something by myself) as a delayed package scriptlet, and<br>
      it would create /etc/rpm-postinsts/util-linux-uuidd at target
      rootfs<br>
      Then i start this rootfs at the first time, it would block, show
      messages as follows<br>
      [ ***] A start job is running ro Run pending postinsts<br>
      <br>
      I seems that&nbsp; systemd can't restart the service successfully at a
      early time<br>
      <br>
      Best regards.<br>
      Li Zhijian <br>
      <br>
      at 2013/10/23 18:53, Yevhen Kyriukha wrote:<br>
    </div>
    <blockquote
cite="mid:CADV-EXHtc2EVTwHhaxGdm3bxmm_uNf2RN4ZinDgZU0mhF=P2vg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div>Current version of opkg has an issue with upgrading systemd
          services:</div>
        <div><a moz-do-not-send="true"
            href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=4213">https://bugzilla.yoctoproject.org/show_bug.cgi?id=4213</a><br>
        </div>
        <br clear="all">
        <div>Best regards,<br>
          Yevhen</div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
Openembedded-core mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>
</pre>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="100000">-- 
Best regards.
Li Zhijian (8555)</pre>
  </body>
</html>


