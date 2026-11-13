Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8829.1794568656767692419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2026 03:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=YA1Uw9rk;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=lDbGhDn2;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.148, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 92D44EC089B
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 06:17:35 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 13 Nov 2026 06:17:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794568655;
	 x=1794655055; bh=AB/EBjwpE9K3IKq9OQePzyCBtSG0bvhMdpQ8j2kIIJA=; b=
	YA1Uw9rkWy/cYyFbApI/RrMM/kIZhmhaE3vqx0dhyQ47kRKE99lzqlnXK/xVku2m
	XQVSeHduJ2SqVpRc/QszUoQXcfzCd8S7fJDEkP+IcY6qNSCTaiuY1qoADymzye3D
	7cly8lkDyhlFW4IFbVW8qmLY9189i2vo2hqZYh3lk82ODjAGmDzmoBtezyTHUfK8
	8XCBMsnjL6pfymciA546ziGjQ0rpe2wuz0+O/gK+qvgvGw+NMK3Qwz59umPbFj6M
	V4zBdOpc6VrVF1mAmUBlDTv6jHtMHiKzzM42Nl1WiyEPnYB7qoaH0k49jGEJVW4I
	yITQvCRn0BU95l9cO6Q8yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794568655; x=
	1794655055; bh=AB/EBjwpE9K3IKq9OQePzyCBtSG0bvhMdpQ8j2kIIJA=; b=l
	DbGhDn28Psi1rA7NcWIOP3znnl902+3u0OxLmdvA76GkU6VQDm07d++YGx0q/n/Y
	iMqcqWTsurTioWA0lUC/SrwiTpQwxX/SZDSAiRUaX1Kw9se1QxeRxAvjDnlBsyGw
	BPYhle6J69zbXU8UKZG1vV3+Iwj2cutQ+SSmGeJxUrVkzWl/RYeLC0yZMqblvhij
	3U8Xt9k4nrMAZ2YXtMARF54ELdmzpLeMtiDAsDPYXBrbeClW1okRr7ZDoNt+8sxn
	5jHUTbbzdU4owlT1ql/429IcVz39FtMHlXIQsnws95maIjOgDcR4g/tPwEJ9KTjV
	ojDnkkUoPcsRfDxnU5SNA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794568655; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:vxIQJlCKkESj9d8EqEqAyh0duQ4s7pv1t28qEZD/k9OGLzv
	nVZ8swPGHBwwEIaAN2E5u32dPkAsIUKx1YlURz54M+0c9F0bJpcot4dAiPX3SVTd
	3Adm9QrvcmxyB+h8XNv201tx81q0Ob84XLuCHW+Z/GsegoJdAlqQC+SDJSwb5wJv
	Xwn9QTI89Na0lGNYNPR1HaULU4BPeRopr1waTJF1MfNktWnf7yyyGlW8AG38RzAX
	W1rETxra/LXV7Xa2KeZeCUSiS0z9lrt4/fZVXlgnKGMdRHYtowwi7KF9G6dulq5G
	IboSIYjcythwWUhfMSSvvkn49WmRPHH/tFtdE6A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bqufE0byUUaCV8jFYZnX9SbINQy+TlMyFaGoSrWqiYY=:NgaiKeDcz3l9AkmRVey5ySpaZ4gk75hPEYmD6EH2k/s=;
X-ME-Sender: <xms:z_H2alNIP7BauyP6RRbDoV4B4J9iW7ImHkArR2RxY6cCqiUlN24YLw>
    <xme:z_H2avZUQj7F9k51TBusOboCDEUpTuukxSk9WQKvF7eHBDlvEXTlymu_-c5ML3j1K
    Lyfr5D57JOspg9t8npgMhyrANsep7P_3QCnoEO-8VxTta--QO9RAJ5I>
X-ME-Received: <xmr:z_H2aho52fU374Z6pTfyp5yeQkHa2CqAKT8qDF4C37NhpNt5hj4khyC2amJYdinLgid5gxdX7UQneU_UpyZikWE6LHve>
X-ME-Proxy-Cause: dmFkZTERQkIznCzQClX9sHE0vPVBIR0Xfjq9ba+ABU9Jr6KelTQjul5gQS6J2ipMzceswE
    +Qnjd/emVB7Lnb3Y93gOZozmUpWUa3m7hve29yVjCsDR9dv0jrPaNrBUXEH2jTivVS2rWX
    SDZjkPSlkBA8FQTH2ryIjbi0JOuW74PMJ41LgEa12mxc3cBhB016gp+uTKGUGkUfY86UeV
    44eMM806kf2KXe7qnRA/UyosGsnoA5GQ0xkGYVeNJ2Mj2y2Ic82I5J0Pmx1L2Pcf1qoRek
    3XPUQqXGW3c51orN4pA/n2/lg1FkrobPbtHaF58eA9s0o5UaEXlohmUXiN99ytvvv/Hyg0
    dO68dQz9AKYGMC8lQQETzZCn8J2GDHvjbMrfqCaJcOAiU6ShQjzwgnwaYob5EVz+7S0Qc9
    1STtWMQ7El32P6HkhaII1I3QlbKx2yND9hMvkzipDd6j7GUD/dGiA/FmnwCMQXIpxuaLU1
    m3F5Cnln083muqjpPW9J1yhFGjyiXO58u4TtoS87qNoMSup388QIfDZ5ojA7ge32G6D0/+
    i3F1tVD/e5lDjScAbHSnvTOON1LKGFMciWuUEj1VT3W0DfWI6h8oJxcG6nxTclnX42p3BA
    Sc0w1BeMHVY7ANw6UkExsfXzU25G04lqcCgQLg8lLLiLIAGdeDIwYwmes1IQ
X-ME-Proxy: <xmx:z_H2arYvje9p0ULUkMbTl_SDCd7mI5JXjmptL2ZL2mSk4EGFTZyVoQ>
    <xmx:z_H2ahRQJBItam0tbQOMpG0r24Hid_2zFW17sasJQi4RTKWdT_IPXg>
    <xmx:z_H2aq6RaY7dt6H22oDYKJoxaWXZzO_hQuIPo_ZlB6PdfQs4oTvTnw>
    <xmx:z_H2auxkEBrDKf0hP3d1Pn6J83oeSrBYqaKIyJNYuaNUM_SVqjCeqA>
    <xmx:z_H2aghEwwbg3Ug1-Ujl5D3T6sX8krLovGq8PYlr-IpBb3pNddzWZu-O>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 06:17:34 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 11:17:33 +0000
Message-Id: <DMU1HUGDPQXM.3EI3VBAA6P4J3@pbarker.dev>
From: "Paul Barker" <paul@pbarker.dev>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Cc: "Paul Barker" <paul@pbarker.dev>
Subject: Re: [OE-core][wrynose 00/35] Pull request (cover letter only)
X-Mailer: aerc 0.22.0
References: <cover.1794561052.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1794561052.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2026 11:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250159

On Fri Nov 13, 2026 at 9:12 AM GMT, Yoann Congal wrote:
> Those are the patches from the last patch review:
> https://lore.kernel.org/all/cover.1794387482.git.yoann.congal@smile.fr/
>
> Interesting patches:
> * "dropbear: add follow-up patches for CVE-2019-6111"
>   I think this is a worthy fix but it has user-visible consequences:
>   `scp -r host:dir <existing dir>` now exits 1 instead of overwriting
>   files (which is the vulnerability being fixed).
> * "python3-urllib3: Fix CVE-2026-97687"
>   May throw a new warning in a unsecure configuration (related to TLS
>   and proxies) that will be dropped in futur version. User code fix might
>   be needed to avoid the warning (but the code will still work).

This has merged, thanks!

The above notes should go into the release notes for the next wrynose
release.

Best regards,

--=20
Paul Barker

