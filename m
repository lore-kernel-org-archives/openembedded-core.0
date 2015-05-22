Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C5E0E609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 13:59:38 +0000 (UTC)
Received: by wghq2 with SMTP id q2so18766238wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nDMkDVUWhrO/q1jZOty/Hw3tyWgBR+4IlBvEr77LwMQ=;
	b=Yb125Ve859XlM6g06SXvBRBAaLWbYVENIWVf7NmjclopYb2A8h9FNVkHvSp7SRTxk1
	EwaHlZmeBL758czxsArwjdrJm5GYVuc2zPW16AXf4hWVc6GvF5erkBplzF5hbBGleFFx
	pB60YFM+Q7E8PrdTP49rjI7uO/gmAaI4gUtP+HNAznur/bA79FF0Q1esaY371mvTJcsp
	8OCoy9BPGmJNvHfx9KCTSW7T7krwzI2fLMsx8adk9jDSHthpQHkvO1qlJpC/hlLbGVbd
	jugHxHOPZNccguSjvPy9Z+8N0+E0/leLq+wXLmK6ZINWCrcIX3vLsTq1928zS32hX0ee
	ZZiA==
X-Received: by 10.180.160.169 with SMTP id xl9mr8073361wib.42.1432303179195;
	Fri, 22 May 2015 06:59:39 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.9.73 with HTTP; Fri, 22 May 2015 06:58:58 -0700 (PDT)
In-Reply-To: <2176018.53hRFMtF2v@peggleto-mobl.ger.corp.intel.com>
References: <1432289348-5624-1-git-send-email-thomas.perrot@tupi.fr>
	<CAP9ODKprXP3_O41a7HAenLXPuJAGTOz0_1bF0xyud+vRvxJcRA@mail.gmail.com>
	<CAGXeWgkEspQ4aK4rXfabQvHCXa+B-KvgWzkL96d86PRisc+sdg@mail.gmail.com>
	<2176018.53hRFMtF2v@peggleto-mobl.ger.corp.intel.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Fri, 22 May 2015 15:58:58 +0200
X-Google-Sender-Auth: aLiraDWHg9EVYxXGhgHFNFzL0FQ
Message-ID: <CAGXeWgnZHt8TKxySy1TQbKBNVxYvyq0FB2A6Mt=KdAxnwvXn1g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-serialgetty: Remove SERIAL_CONSOLE definition, because it depends of machine definition. Set it, here, can be make the value is not good.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 May 2015 13:59:40 -0000
Content-Type: multipart/alternative; boundary=047d7b624ac234f41c0516ac1267

--047d7b624ac234f41c0516ac1267
Content-Type: text/plain; charset=UTF-8

Sorry, I meant systemd-serialgetty.bb from meta instead of meta-systemd.
So replace "?=" by "??=" should be a better solution.

--047d7b624ac234f41c0516ac1267
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I meant <a href=3D"http://systemd-serialgetty.bb" t=
arget=3D"_blank">systemd-serialgetty.bb</a> from meta instead of meta-syste=
md.<div>So replace &quot;?=3D&quot; by &quot;??=3D&quot; should be a better=
 solution.<div><br><div><br></div><div><br><div><br></div></div></div></div=
></div>

--047d7b624ac234f41c0516ac1267--
