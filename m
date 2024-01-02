Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E505C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 18:28:19 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.35926.1704220097798980505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 10:28:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 54EB6A10;
	Tue,  2 Jan 2024 19:28:15 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.12]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rKjUr-35mEkq0; Tue, 2 Jan 2024 19:28:14 +0100
Date: Tue, 02 Jan 2024 19:28:08 +0100
From: f_l_k@t-online.de
Subject: Re: [RFC][oe-core][PATCH] utfcpp: add recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <WMCN6S.8QPJEZQJ520H1@t-online.de>
In-Reply-To: <CANNYZj_0UnYB6RUkMcxEgWhhcRxaHCBB1cExKWiaQRdYMaXCUw@mail.gmail.com>
References: <17A68917D46BD8C6.19767@lists.openembedded.org>
	<QIXM6S.ZGI08VQ09CW21@t-online.de>
	<CANNYZj9Lfxtbh+Uc05xbNyC5PuHX5S51tvVBPV7H50eMUSuKug@mail.gmail.com>
	<K9AN6S.UGINW8B1ETV41@t-online.de>
	<CANNYZj_0UnYB6RUkMcxEgWhhcRxaHCBB1cExKWiaQRdYMaXCUw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jcXA5cOXZZro6do0JZtD"
X-TOI-EXPURGATEID: 150726::1704220094-AB7FD9F9-12BD2175/0/0 CLEAN NORMAL
X-TOI-MSGID: 783d4b4c-49e5-457e-9123-0ad0b02a3ffc
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 18:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193256

--=-jcXA5cOXZZro6do0JZtD
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Jan 2 2024 at 06:53:02 PM +01:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> So do I understand correctly that the two upstreams mutually
> contradict each other?

<https://github.com/nemtrif/utfcpp/commit/4965d378fb141a21c8afa7c283a8af4725e6a57e>
The announcement to deprecate support for cmake in utfcpp was made only 
recently.
At the moment, cmake is still supported and in my opinion should not be 
declared obsolete. Maintaining CMakeLists.txt for a header-only library 
doesn't seem like that much work. This smells like an ideological 
discussion to me.

Lets wait and see how the taglib developers will react. Until then, it 
seems to make sense to use cmake because it is nicely integrated into 
taglib




--=-jcXA5cOXZZro6do0JZtD
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Jan 2 2024 at 06:53:02 PM +01:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">So do I understand correctly that the two upstreams mutually
contradict each other?</div></blockquote><div><br></div><div><a href="https://github.com/nemtrif/utfcpp/commit/4965d378fb141a21c8afa7c283a8af4725e6a57e">https://github.com/nemtrif/utfcpp/commit/4965d378fb141a21c8afa7c283a8af4725e6a57e</a></div><div><div>The announcement to deprecate support for cmake in utfcpp was made only recently.</div><div>At the moment, cmake is still supported and in my opinion should not be declared obsolete. Maintaining CMakeLists.txt for a header-only library doesn't seem like that much work. This smells like an ideological discussion to me.</div></div><div><br></div><div>Lets wait and see how the taglib developers will react. Until then, it seems to make sense to use cmake because it is nicely integrated into taglib&nbsp;</div><div><br></div><div><br></div></div>
--=-jcXA5cOXZZro6do0JZtD--


