Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C34AF77BC5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 11:13:36 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id n4so7663581qkc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 04:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LJibLfVVsDkiF7TVI3uE1o74+HefWBwLOG03lXo4quY=;
	b=0jQvc8TOySVMf4S55Tz17PcwOBiiorBB1VNPOTqMYucW1YHeCH3wQSXOkkyzjkIPrS
	Bv/SGD7TbwNBTvcQ/oWOvsn97Ol4C5u2F2fzRX1UwbPlCRs7j1VguK0aG/5FWzb7LPve
	UXljckf6L3iWZyfcgCq74ygwGtBm83/gPfTRlkU2TxHQVJlIhArNdsiHG4mVcEOGFH/k
	LQhhPqP1WTK+e0FradAX5HQrDDw6s/2oJGoFtjz+7Kpb6RHJRi/HyOG+H8qLR7Nfgl3M
	JbDroCdS+QguGrtyf6uKNktRpj/JJkJvHRIYtMAfn3yvRYKpENvXpoKExXffMpTfkJFY
	SUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LJibLfVVsDkiF7TVI3uE1o74+HefWBwLOG03lXo4quY=;
	b=RqOTT5pUvbyFclSblClYZ6tYoS0vlfN6sXpj/dDYphEbJPlTwDZuWdLojgfuMnSuXf
	+P56Wo7COzknoCfNO41q13XRLTvHg6NPl4uDHvYLhb13thAsZ4en/lW0Zpdoh7teii/J
	GMi9gx7w+PZ/qki7eXhBBqwKCoEtfGbn6kl37Y8TL8j62+tdKtz58k5682IbhWLFohKE
	q4G/aHcD86xekTA8bfQHm+t3OiQt0dwOrglf8/Dj7v9VYnSsmJT7F5Z8NHfZNB5jWpzX
	5yhJ5fKbW2P2swr0Epa9r95N03jUCe6Odlhk8O4nGlZJ0jyY2zITxkTKTef35TBVAkXW
	iwBQ==
X-Gm-Message-State: AN3rC/7z24ft3B9Hg5VcahcMLsaSlQpy2F7iwKS7BMDUWzeyUm7sSaDJ
	xjVebuS+/kmUN4mhp/g9FlKDwzvBOCp8
X-Received: by 10.55.75.75 with SMTP id y72mr8166317qka.36.1493896417438; Thu,
	04 May 2017 04:13:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Thu, 4 May 2017 04:13:17 -0700 (PDT)
In-Reply-To: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20170503192603.41086-1-leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 May 2017 12:13:17 +0100
Message-ID: <CAJTo0LbMfsoR1EYtmB5k4Fgc-kNh96idBUnOeh8wUUq-kWw98A@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_ipk.bbclass: Include a space followed by a dot for empty description lines
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
X-List-Received-Date: Thu, 04 May 2017 11:13:40 -0000
Content-Type: multipart/alternative; boundary=001a114a6abe4b0501054eb0dd99

--001a114a6abe4b0501054eb0dd99
Content-Type: text/plain; charset=UTF-8

On 3 May 2017 at 20:26, <leonardo.sandoval.gonzalez@linux.intel.com> wrote:

>                          line = textwrap.fill(t.strip(),
>                                               width=100000,
>                                               initial_indent=' ',
> -                                             subsequent_indent=' ') or '.'
> +                                             subsequent_indent=' ') or '
> .'
>

The dpkg patch removes use of textwrap: so why bother with textwrap if the
wrapping width is 100000 characters?

Ross

--001a114a6abe4b0501054eb0dd99
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+T24gMyBNYXkgMjAxNyBhdCAyMDoyNiwgIDxzcGFuIGRpcj0ibHRyIj4mbHQ7
PGEgaHJlZj0ibWFpbHRvOmxlb25hcmRvLnNhbmRvdmFsLmdvbnphbGV6QGxpbnV4LmludGVsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiPmxlb25hcmRvLnNhbmRvdmFsLmdvbnphbGV6QGxpbnV4LmludGVs
LmNvbTwvYT4mZ3Q7PC9zcGFuPiB3cm90ZTo8YnI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+PGRpdiBpZD0iOjJ3diIgY2xhc3M9ImEzcyBhWGpDSCBtMTViY2Zj
N2QwNGMxYWU1ZCI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBsaW5lID0g
dGV4dHdyYXAuZmlsbCh0LnN0cmlwKCksPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgd2lkdGg9MTAwMDAwLDxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGluaXRpYWxfaW5kZW50PSYjMzk7ICYjMzk7LDxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN1YnNlcXVlbnRfaW5kZW50PSYjMzk7ICYjMzk7KSBvciAmIzM5Oy4mIzM5Ozxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN1YnNlcXVlbnRfaW5kZW50PSYjMzk7ICYjMzk7KSBvciAmIzM5OyAuJiMzOTs8
L2Rpdj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPlRoZSBkcGtnIHBhdGNoIHJlbW92ZXMgdXNlIG9m
IHRleHR3cmFwOiBzbyB3aHkgYm90aGVyIHdpdGggdGV4dHdyYXAgaWYgdGhlIHdyYXBwaW5nIHdp
ZHRoIGlzIDEwMDAwMCBjaGFyYWN0ZXJzPzwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48
YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPlJvc3M8L2Rpdj48L2Rpdj4NCg==

--001a114a6abe4b0501054eb0dd99--
