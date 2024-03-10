Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC028C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 17:03:03 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.41827.1710090179775268288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 10:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id 7B2DF5153;
	Sun, 10 Mar 2024 18:02:57 +0100 (CET)
Received: from [192.168.178.67] ([84.154.166.16]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjMZZ-17I34y0; Sun, 10 Mar 2024 18:02:54 +0100
Date: Sun, 10 Mar 2024 18:03:16 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.13.9
To: Markus Volk <f_l_k@t-online.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <G165AS.UHPXD5QHY4K91@t-online.de>
In-Reply-To: <17BB725268800180.5850@lists.openembedded.org>
References: <17BB704B3D5D1758.5850@lists.openembedded.org>
	<R915AS.S2SD7P4CMM6X2@t-online.de>
	<54530dfa95ef0ca744fde5ab2b83bb402e4a50fd.camel@linuxfoundation.org>
	<17BB725268800180.5850@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3UGVwC6z6O3HhLwV8B9B"
X-TOI-EXPURGATEID: 150726::1710090174-33FFC937-D289C9D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 69279e0a-e5ce-4c8b-ace4-59496bc43979
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 17:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196902

--=-3UGVwC6z6O3HhLwV8B9B
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Mar 10 2024 at 08:56:21 AM -07:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> I'll do some tesing with this patches included in vala and will send 
> a patch for it.

The problem I have with creating the backport patches:
 vapi/metadata/Gtk-4.0.metadata should be patched and that file is not 
included in the tarball version of vala


--=-3UGVwC6z6O3HhLwV8B9B
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Mar 10 2024 at 08:56:21 AM -07:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite">I'll do some tesing with this patches included in vala and will send a patch for it.</blockquote><div><br></div><div>The problem I have with creating the backport patches:</div><div>&nbsp;vapi/metadata/Gtk-4.0.metadata should be patched and that file is not included in the tarball version of vala</div></div>
--=-3UGVwC6z6O3HhLwV8B9B--


