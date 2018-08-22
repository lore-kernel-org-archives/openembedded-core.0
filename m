Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 22D5F793C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 14:57:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j26-v6so1880814wre.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 07:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=c7fgg+heCKxDb2wmorsC0WLYXGk4KXikHKq8M3juyLI=;
	b=CLGMRfkoDbSsQkq25U1TZZEYKlnfENpjyqW0XUMck5/gk3qaabd23bRZrzfK4WMHMw
	EHqfi+9dKITVMazCPu33fgIY0yjDXIAV4tCWh8H+AWwuSBcgw+stRdhG+/haj6ul3duL
	tA1EhiCQBOCXHxD0wtXizJOb2SPGtGqmCjnHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c7fgg+heCKxDb2wmorsC0WLYXGk4KXikHKq8M3juyLI=;
	b=RC/Xp1rOavQ9cyPm7u9sBmYhdFB86TN5YcW0wgcLQTMqbRRM83TLBd2oBiDOjEa9e0
	/H8emo0F1DKny8AFj+30P4U7EEztJUF+qv62KtvOIsNFHOLUqwG0nhLa7fNSixS+mL7G
	1DCnixEoszdei/zADj090klGQpV1WULg0PPZsvxDAOBCZdATcPsEo90iFBkHZFO5Fe5L
	XVWn9zN9dK4hdYaQMNdYIMrsUr3tIsmLe4CRThGDqM5gh7BFjweoAQC5hi4+N5JDVdQe
	kxMpr4M5g3SUJtsKi8qKrE11USEdpGpYU48FhN0E1iMnikuMnda62A8pgYzOlUEOI78u
	wIZw==
X-Gm-Message-State: APzg51DEG5yaUkkkw8nBOXx+zo93kQl3s5fmCdGwwXI5IctzPxKWfsHo
	qlPbQiZP9kTxYfTIPWuhgC4FRinOpT4=
X-Google-Smtp-Source: ANB0VdZw5gmbI9BzCvsOKViDJhA84gW9nY5wQKLTTnLKiUAnlfys4bYJtxGmpPDohdpYwi9mVv1CSA==
X-Received: by 2002:adf:ad47:: with SMTP id
	p65-v6mr14756559wrc.222.1534949825770; 
	Wed, 22 Aug 2018 07:57:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	72-v6sm2209273wrb.48.2018.08.22.07.57.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 Aug 2018 07:57:04 -0700 (PDT)
Message-ID: <8fe6af7262abdf19ade58f0c04a25637b20d5aef.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 22 Aug 2018 15:56:58 +0100
In-Reply-To: <CAPybu_2BB1XmsvrrME9poTKABtW+C6qZvJo3eoo=MDUDJa5cuA@mail.gmail.com>
References: <20180821145858.18459-1-ricardo.ribalda@gmail.com>
	<10e5ea973727e06604a83299fdd5a8d4cfa2633a.camel@linuxfoundation.org>
	<CAPybu_3tUu0LKA1gdSj-MFYfhxiHz62wXrP2ivETSMNiWdWyDg@mail.gmail.com>
	<83a93f3542ad88b01b073b7875839dd2e2c1bf44.camel@linuxfoundation.org>
	<CAPybu_0+uwJghGGyPEAR1bQEtOcFKeH9P2okdhcUBzJ_E-BLDw@mail.gmail.com>
	<a031c89ea6cdb522999796f93b8c1a2c8ec8e4c5.camel@linuxfoundation.org>
	<CAPybu_0QAOWyz9+XGKEADtZqj+wj2Ro7hQx_q8BkX9BBrjPPCg@mail.gmail.com>
	<e0ffd2ccefb534b1c4171449256c123e9e6b5e55.camel@linuxfoundation.org>
	<CAPybu_1NAf_p0zfZSPTAbweKYunAyGL_6tLwhao-Kw6be3FX9w@mail.gmail.com>
	<CAPybu_0oQ2sjiVTMqXXbvTs+3dagLn8Wps5-AxYhqtjKz-9M6w@mail.gmail.com>
	<15ac7737a9a1a20bfbb6ed98a79ba140a6e6c786.camel@linuxfoundation.org>
	<CAPybu_2BB1XmsvrrME9poTKABtW+C6qZvJo3eoo=MDUDJa5cuA@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix ldd bug: not a dynamic executable error
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
X-List-Received-Date: Wed, 22 Aug 2018 14:57:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-08-22 at 15:39 +0200, Ricardo Ribalda Delgado wrote:
> On Wed, Aug 22, 2018 at 3:37 PM <richard.purdie@linuxfoundation.org>
> wrote:
> > > RTLDLIST="/lib/ld-linux.so.2 /lib64/ld-linux-x86-64.so.2
> > > /libx32/ld-linux-x32.so.
> > 
> > I just looked at what the function is doing and its broken. What is
> > DEFAULTTUNE set to in your build?
> 
> DEFAULTTUNE="dbfp4"

As I suspected.

Try applying:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=d69f0127b44a5216dd21ad972d6f2b2e4cda6d13

and 

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=95aa56ae11852c100be68d13aaffa9c83273b46b

and then seen if that fixes things.

Cheers,

Richard

