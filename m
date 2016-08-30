Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4F9436011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 13:37:52 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id o80so36434073wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tjYiAFaoiN6FcjaVSWQhiBup2f6Z4piOu6IwS/LYF5Y=;
	b=xp50mUys5yI4cDOmI4bcjcI/G3bA8OMtBXknu0vy5HRuopEl41mHbhivTLJgqkDRQv
	GKc8D10IkTLpRK4R6hcqnFbpLbv8zEq5wnikPozkFm9JjdF8K2uwjqOmBMymFRBso1Fl
	ySc1ox6tbHUnlqokvknYQAIu3PvnvIckkgPBqa9Oh1bZSV74qn/xEh1+F0LCDlmohTN+
	ptgO/jXNEWPMDqUf9PusY88Pas82BysEVx1MTR2UoY4jWQwg235Qa02lhDgfQln+RYmV
	ClbRzvYvQ3odAaSJvJO7VDAjKtzxz9IyLy5/J6mPdfBhzk67F2weKf0s5xoimXxGd+x5
	Wlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tjYiAFaoiN6FcjaVSWQhiBup2f6Z4piOu6IwS/LYF5Y=;
	b=HZ99Pt1zIw1kYG5QjXbmadq4q3TYUl5yTbkgzMJxTTA+mPp0NaKYaH/8C589pWSQMk
	6glV6/rmX+C4r/x3HaIRywKIzvxijKlTnnyfUSvSTkTC5Z/CrvESpnaYyue7LWDXAwFl
	Fy9o8M33vlytgVOqteP2oiEkXU1g0AlpAlnfjTBgOnFLxCF50vPhg+hJxhxCP3mRazzg
	B1VSwd3lhS/uA7kSjTiQD//JUE0vkrMNtgU/2Mz/SmGwbB9uMqWeeMXMMUCcv666Ena5
	GoFJISGMrpeRvmBBiEG+tcHR3QEkzkfcymUxoUys2iI2o23tmKIeiJFckMZeMpxntkKs
	17Sw==
X-Gm-Message-State: AE9vXwNvayrqZWgoXs7Vm5CEABPRiVpOsHxksPlDukR1ehYp8LZntIglU+oMfDxU/MZjRcuxAOKU55H4g47u7w==
X-Received: by 10.28.131.208 with SMTP id f199mr3785635wmd.116.1472564273254; 
	Tue, 30 Aug 2016 06:37:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Tue, 30 Aug 2016 06:37:32 -0700 (PDT)
In-Reply-To: <CAAPZna3477dZ6jJDGSuJWMjJX14cUDTtKxzOmpnOm-OZ6smszQ@mail.gmail.com>
References: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
	<CAAPZna3477dZ6jJDGSuJWMjJX14cUDTtKxzOmpnOm-OZ6smszQ@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 30 Aug 2016 15:37:32 +0200
Message-ID: <CAPybu_37jJw6-drnv3vGa6sHraKynB_dHbAmVBwz0BhUWUNDRA@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-3.5-manifest.inc: the core module RDEPENDS on misc
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
X-List-Received-Date: Tue, 30 Aug 2016 13:37:53 -0000
Content-Type: text/plain; charset=UTF-8

Hi Fabio

Thanks for your the reply. Yes I was using krogoth. There is no need
for my patch in master.

Thanks for your help!

