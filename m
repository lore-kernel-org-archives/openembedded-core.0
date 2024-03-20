Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1994DC54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 11:25:32 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.41406.1710933921737159708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 04:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id E6191238B3;
	Wed, 20 Mar 2024 12:25:19 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmu4M-0DY4PY0; Wed, 20 Mar 2024 12:25:19 +0100
Date: Wed, 20 Mar 2024 12:25:43 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <V29NAS.S84U42Y5BCDK@t-online.de>
In-Reply-To: <70D06732-17CB-4BF3-A35C-96C684E011E2@arm.com>
References: <20240320104300.757486-1-f_l_k@t-online.de>
	<70D06732-17CB-4BF3-A35C-96C684E011E2@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uT+c0zh/3R6laZH18Kyj"
X-TOI-EXPURGATEID: 150726::1710933919-D6FFA93F-2F42001C/0/0 CLEAN NORMAL
X-TOI-MSGID: 37fe3192-212d-41bf-a1b1-18991ad3657b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 11:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197358

--=-uT+c0zh/3R6laZH18Kyj
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 11:15:35 AM +00:00:00, Ross Burton 
<Ross.Burton@arm.com> wrote:
> Are you testing with gobject-introspection?

yes, my test was done with gobject-introspection and I ended up with

| Run-time dependency gobject-introspection-1.0 found: NO (tried 
pkgconfig)
|
| ../glib-2.80.0/girepository/introspection/meson.build:43:17: ERROR: 
Dependency "gobject-introspection-1.0" not found, tried pkgconfig
|
| A full log can be found at 
/home/flk/poky/build/tmp/work/corei7-64-poky-linux/glib-2.0/2.80.0/build/meson-logs/meson-log.txt

and adding that depend (or using inherit gobject-introspection) caused 
circular dependency


--=-uT+c0zh/3R6laZH18Kyj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 11:15:35 AM +00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Are you testing with gobject-introspection? </div></blockquote><div><br></div><div>yes, my test was done with gobject-introspection and I ended up with</div><div><br></div><div>| Run-time dependency gobject-introspection-1.0 found: NO (tried pkgconfig)</div><div>|&nbsp;</div><div>| ../glib-2.80.0/girepository/introspection/meson.build:43:17: ERROR: Dependency "gobject-introspection-1.0" not found, tried pkgconfig</div><div>|&nbsp;</div><div>| A full log can be found at /home/flk/poky/build/tmp/work/corei7-64-poky-linux/glib-2.0/2.80.0/build/meson-logs/meson-log.txt</div><div><br></div><div>and adding that depend (or using inherit gobject-introspection) caused circular dependency</div></div>
--=-uT+c0zh/3R6laZH18Kyj--


