Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31CAC282D1
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 08:12:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.11888.1741507950313750939
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Mar 2025 00:12:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 3974E87;
	Sun,  9 Mar 2025 09:12:28 +0100 (CET)
Received: from [192.168.178.20] ([84.154.173.73]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1trBlr-0mjELQ0; Sun, 9 Mar 2025 09:12:27 +0100
Date: Sun, 09 Mar 2025 09:13:10 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] glib-2.0: update 2.82.4 -> 2.84.0
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Message-Id: <Y5KUSS.2BTZWWUT9IO53@t-online.de>
In-Reply-To: <3ebbe1b5e26f764636ec34c4acebe4d8a588386f.camel@linuxfoundation.org>
References: <20250307163724.3459192-1-f_l_k@t-online.de>
	<3ebbe1b5e26f764636ec34c4acebe4d8a588386f.camel@linuxfoundation.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-m7ZU64sIXeEvpeSj3bvc"
X-TOI-EXPURGATEID: 150726::1741507947-B37FD970-B6269497/0/0 CLEAN NORMAL
X-TOI-MSGID: 341456e1-0676-4414-8e6e-f66f4908dbc7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 08:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212478

--=-m7ZU64sIXeEvpeSj3bvc
Content-Type: text/plain; charset=us-ascii; format=flowed

Yes, sorry.

v2 fixed only the installed-vs-shipped issue I have seen if building 
without PACKAGECONFIG[test]

I'll have a look at the ptest issue tomorrow.

On Sat, Mar 8 2025 at 18:07:12 +00:00:00, Richard Purdie via 
lists.openembedded.org 
<richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
> On Fri, 2025-03-07 at 17:37 +0100, Markus Volk via 
> lists.openembedded.org wrote:
>>  - Add option for tests to prevent them from being built without
>>  PACKAGECONFIG[tests] being selected
> 
> The v2 still has ptest failures:
> 
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1074>
> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1077>
> 
> Cheers,
> 
> Richard
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212474): 
> <https://lists.openembedded.org/g/openembedded-core/message/212474>
> Mute This Topic: <https://lists.openembedded.org/mt/111570638/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-m7ZU64sIXeEvpeSj3bvc
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Yes, sorry.</div><div><br></div><div>v2 fixed only the installed-vs-shipped issue I have seen if building without PACKAGECONFIG[test]</div><div><br></div><div>I'll have a look at the ptest issue tomorrow.</div></div><div id="geary-quote" dir="auto"><br>On Sat, Mar 8 2025 at 18:07:12 +00:00:00, Richard Purdie via lists.openembedded.org &lt;richard.purdie=linuxfoundation.org@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Fri, 2025-03-07 at 17:37 +0100, Markus Volk via lists.openembedded.org wrote:
<blockquote> - Add option for tests to prevent them from being built without
 PACKAGECONFIG[tests] being selected
</blockquote>
The v2 still has ptest failures:

<a href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1074">https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1074</a>
<a href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1077">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1077</a>

Cheers,

Richard
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#212474): <a href="https://lists.openembedded.org/g/openembedded-core/message/212474">https://lists.openembedded.org/g/openembedded-core/message/212474</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/111570638/3618223">https://lists.openembedded.org/mt/111570638/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-m7ZU64sIXeEvpeSj3bvc--


