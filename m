Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF5477E91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 16:08:09 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id h64so20356723iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4w/PC5xOe7E0vIDARRPt4Y/qzvj2skB5XR1DHSNhjME=;
	b=KH0sze/6JLU1GypcnM13n3neR7tItfe6waqYxooNrrTgjV/Vq6kM2GioM+L58K/ykc
	tgQ6pFjWIahIoE7uyIeY+bYvcDakutIzklxmxFGBp3WK6COiLuUOx1pPHepPDIbA9fdP
	wCnlXJZ3v2XCUjRTJwZGWYqxL3p2TKZmRuh4IE+QI7c+P1UqSlrKMqzxH9/6Zlitkivw
	7WuVo2MGEzV59jOTKQmZO/gbEnTo0BYL1nH4F3Dp/L5xe2/e3VLOqm2CKZdDCh4Ry4A1
	ijZlvmD6xElBk1HFsgZiSBpQGRLCiv4nORDF1UE3MDDooMjZBGcRiAZxApG9etd3kYBq
	96vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4w/PC5xOe7E0vIDARRPt4Y/qzvj2skB5XR1DHSNhjME=;
	b=P3vZj3ky7KUexnjmhrD2rx3fqKeFM+rwpp3wYEgEm3bM5NKbN36ikKEWrANXA2nk/M
	2WKjxWlNrxIA8V/qtwqMtrHO/nL5WMRvn2aCvVF7g61+Zi7swmLvgngBt72Y5kBhGUOF
	PtMZegvt8iGlfzzW/nY0A6tud7tpGfwcCLm1JjXOWDZtrna2BS1kf2QC1h3e/MsyB8aH
	H82zpe+HfUwx59eUOzrb+nMzzgX/CjGnU6LKUomx/RGp8HDKgMPnPuP3XuXAOtbjtsKr
	AoBVoqtab/jbvf+Mnl3BMZnAZ98FOa54cW0RfDj425VUnZYue5x8No5QTYu/X9/dXEr7
	OxiA==
X-Gm-Message-State: AKS2vOzUR88hbc3HyYUo4rVgSnaqhbsi7avRiFEAgrkjskINch5OwBvd
	VXRNx4tuorNX8mr79aA=
X-Received: by 10.107.139.145 with SMTP id n139mr8007430iod.166.1498579690809; 
	Tue, 27 Jun 2017 09:08:10 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	b17sm1573050itd.0.2017.06.27.09.08.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 27 Jun 2017 09:08:09 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1498579688.11937.3.camel@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 11:08:08 -0500
In-Reply-To: <20170606023049.6415-1-JPEWhacker@gmail.com>
References: <20170606023049.6415-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Subject: Re: [morty][PATCH] archiver: Escape recipe name in regex
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
X-List-Received-Date: Tue, 27 Jun 2017 16:08:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-06-05 at 21:30 -0500, Joshua Watt wrote:
> From: Joshua Watt <jpewhacker@gmail.com>
> 
> The recipe name needs to be escaped when using it in a regular
> expression so
> that and special characters are treated literally
> 
> (From OE-Core rev: 53c8cceb744adda1bf899d62071d11b20a5dea98)
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/archiver.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/archiver.bbclass
> b/meta/classes/archiver.bbclass
> index 3543ca9..188f8c0 100644
> --- a/meta/classes/archiver.bbclass
> +++ b/meta/classes/archiver.bbclass
> @@ -349,8 +349,8 @@ python do_ar_recipe () {
>      bbappend_files = d.getVar('BBINCLUDED', True).split()
>      # If recipe name is aa, we need to match files like aa.bbappend
> and aa_1.1.bbappend
>      # Files like aa1.bbappend or aa1_1.1.bbappend must be excluded.
> -    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %pn)
> -    bbappend_re1 = re.compile( r".*/%s\.bbappend$" %pn)
> +    bbappend_re = re.compile( r".*/%s_[^/]*\.bbappend$" %
> re.escape(pn))
> +    bbappend_re1 = re.compile( r".*/%s\.bbappend$" % re.escape(pn))
>      for file in bbappend_files:
>          if bbappend_re.match(file) or bbappend_re1.match(file):
>              shutil.copy(file, outdir)

Ping?

