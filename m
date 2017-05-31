Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 913F178044
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 02:26:55 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 7so105375472wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=9PtL7kAJYXBbKoKei30hDt2J6oyjWys40jF2ygKQ2c0=;
	b=hpskjxvnQYp8Wh2wP06nJz22aEWPXTbshzNTuUtTeYXLmaWtBquUuxXsadnJJiU2fo
	dmmdyrV0LuVPS4V6amW2c3IGqIMOngoGOjbeo6YNWP0sqdrXHF51mtQvEePnFJNstOYB
	dMuS6vfP8gCor8TV5gbyrPpgV0l/ZWalmzuzJERDgL1EllXIUTm4MDqwSK9r1ZJFLMZo
	9Vbg7YXH+G1MS1cdrE+vUz/ixPy4KVpnLeCmOawH5haEv12HVAdhxnSsRsP+JSeTq5Yc
	T3sWi6ASMhGbjqteE/GcPuvp1JJWP1IiYX/VNI63OwKbajDIUKnSuHyPT721WyBJ8dOD
	8M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=9PtL7kAJYXBbKoKei30hDt2J6oyjWys40jF2ygKQ2c0=;
	b=Xt+w9+qQXjrFwpUep5GdSxMjSinR6akHZiPtTUPg65Hf+6vrIRq8xmticdbgFKvR28
	TgcHPFvARwq49gDsbxltNjTE+f1f4hJuoDaKR6jwiFJ3XJhoz66Ef5flceiSQ76jsRfL
	6vF56MLKzYB18sme/dQ3EHSt1fYrDt07b3gAh9wkfVQw2dzY2V8YaR1vTSc3GjF2ZSjF
	C1SJ9F+xAZ+i4CBLqiKJ09SPA8rQRVX/kAFaYfdB9ZDFzzYMUBJ0mrciH1dEIAlBMqjK
	Ha2tN2zIwGbNn4lMvJDWwUa1JpXijUZhHbrxwt0F5rX35RGSnQuc4dRlz8sGm5gzzyEs
	MmHg==
X-Gm-Message-State: AODbwcBbxkYiWRln0QqG56VSmOrQpcX+noER+6K51Q0pmBGm8C5Hu8GJ
	BQGBAHKGRAM3f04TWx0=
X-Received: by 10.28.175.84 with SMTP id y81mr3907594wme.25.1496197616211;
	Tue, 30 May 2017 19:26:56 -0700 (PDT)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com.
	[74.125.82.43])
	by smtp.gmail.com with ESMTPSA id 63sm22620844wmt.9.2017.05.30.19.26.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 May 2017 19:26:55 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wm0-f43.google.com with SMTP id e127so4903334wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 19:26:55 -0700 (PDT)
X-Received: by 10.28.208.130 with SMTP id h124mr3798900wmg.21.1496197614954;
	Tue, 30 May 2017 19:26:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Tue, 30 May 2017 19:26:54 -0700 (PDT)
In-Reply-To: <ee1c6e65-f2f1-4873-48ed-0b5e57f293ef@intel.com>
References: <1495474501-10841-1-git-send-email-california.l.sullivan@intel.com>
	<ee1c6e65-f2f1-4873-48ed-0b5e57f293ef@intel.com>
Date: Tue, 30 May 2017 23:26:54 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp_tF7sxJBH7zn+qycX3k6_6rD2vQvQ4uV=P1VyrTZRAQ@mail.gmail.com>
Message-ID: <CAP9ODKp_tF7sxJBH7zn+qycX3k6_6rD2vQvQ4uV=P1VyrTZRAQ@mail.gmail.com>
To: Cal Sullivan <california.l.sullivan@intel.com>
Cc: "akuster@mvista" <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-boot.bbclass: Add configuration data to secondary EFI partition
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
X-List-Received-Date: Wed, 31 May 2017 02:26:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 9:10 PM, Cal Sullivan
<california.l.sullivan@intel.com> wrote:
> It looks like this was accepted on master. Would it be possible to backport
> this fix to pyro as well?


I support this backport as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

