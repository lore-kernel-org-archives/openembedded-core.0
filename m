Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id C16E26FFA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 11:46:28 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id a81so24014oii.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=upYWBfGw//Q0zUs3rQlZmcmin2+yGoLZtTXcygx5thA=;
	b=zGGVkLXr3yXCODD/+74e0jVOz/JoudHVplQiAuzQJxu9vYL9l/xhlBZ54HC/UQq5lL
	jBT3T7ZLyt0tsGqc+rs//b6lRrsbykGn8ets517X9c3nUdzpPuh7ZX7PAgGIaJD2ZxwG
	k+R0Zj+TdOVXaY1auHr2hGGquQTQ5llgyubKPfIE4mvPn1SAV1IpeEstsk0blBnUnjbw
	3n2n0vO/v5xCuc4mzsW1B9ynxIE1cz1xSt/i7VpDIUeiOaje0KFpE5X+rkyC5+AFmDsr
	cll5fG508j7vQ7/EoYRiW3X47SMcqI2Ys+DR28GS8jFOgucaa9whXeqHjf91RwgRGiL+
	qrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=upYWBfGw//Q0zUs3rQlZmcmin2+yGoLZtTXcygx5thA=;
	b=fz5crNsFTiXpewF9/e2e/RmQOuEX5YlvwPHihPAspOgADPwXS5mjKGMgqLtv4ory1x
	QYSdjxvQAoR+e8DD1V2Wh0UmtXJCEdgC2WL24wAjWU6Lg0uopaYfilp1rSA/uOSV5Gp8
	QrH1aW5AHGAFC4S9kIiq91/lY2Ju9Rt9YDtdHx8/mzlsIfZ2eERC/Bp2nu/u+mlJTOQv
	zZehrcBLzJYe0T28AFxnvGhCobrdgn6ciYO0hwrWa+bGu8o6e98WKk0HXLmCuu2q7w3F
	DBT7w/z8HfG9iBRrhtLn6SKj1jPEBV9pmRciNzQdz3zG9t/ZkebrvzOmAfoRdAdM4Xe0
	uLAQ==
X-Gm-Message-State: AJaThX4LBf9nSTSdgTKAkjOGZdAWQPnwsODrAr53EupgFihUAwVCytVM
	w5haKtH0Q8TyuRCurQtgDEGSXeCR
X-Google-Smtp-Source: AGs4zMal0taU8gT0BBJMwQ84F3jXCXuL/RpHnFnMaS0hlrHL8FbZO2SXBrVS21GUOQlZiCI8EWF1rQ==
X-Received: by 10.202.173.207 with SMTP id w198mr19920599oie.12.1511869589333; 
	Tue, 28 Nov 2017 03:46:29 -0800 (PST)
Received: from mail-ot0-f178.google.com (mail-ot0-f178.google.com.
	[74.125.82.178]) by smtp.gmail.com with ESMTPSA id
	k67sm11991400oib.0.2017.11.28.03.46.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 03:46:28 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f178.google.com with SMTP id u10so30230otc.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 03:46:27 -0800 (PST)
X-Received: by 10.157.80.13 with SMTP id a13mr1954268oth.370.1511869587549;
	Tue, 28 Nov 2017 03:46:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Tue, 28 Nov 2017 03:46:26 -0800 (PST)
In-Reply-To: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
References: <1511810927-22695-1-git-send-email-martyn.welch@collabora.co.uk>
Date: Tue, 28 Nov 2017 09:46:26 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqaVU6J67djndKrTF7QRff70J6GsBCqsdY2fc0ghwrT-w@mail.gmail.com>
Message-ID: <CAP9ODKqaVU6J67djndKrTF7QRff70J6GsBCqsdY2fc0ghwrT-w@mail.gmail.com>
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v5 1/2] image.bbclass: add prohibited-paths QA test
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
X-List-Received-Date: Tue, 28 Nov 2017 11:46:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 27, 2017 at 5:28 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:
> Sometimes we wish to ensure that files or directories are not installed
> somewhere that may prove detrimental to the operation of the system. For
> example, this may be the case if files are placed in a directory that is
> utilised as a mount point at run time, thus making them inaccessible once
> when the mount point is being utilised.
>
> Implement the prohibited paths QA test, which enables such locations to be
> specified in a "IMAGE_QA_PROHIBITED_PATHS" variable. This implementation
> allows for a colon separated list of paths to be provided. Shell style
> wildcards can be used.
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

