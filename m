Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1662B7CE5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 10:15:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n11so1448964ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wbiSQpdqZkTO2gJf3OfgkTUaSJedvrxQRI8CrDzlU1U=;
	b=cXq0Mu4amSTRIt+0AC43qSclNgepJOTLOTbwaLHT6GziQji/DFHXso2JKAQ/Vpdvwd
	0vEZrQ8mYvd6shgl1c+BvDA8R3YrIEtoL5nEQyZcIRT25TloRtacP/QyBVu58rAc+xMI
	K1M6gDG4svwYvLS2VikQ5o8qa4SRi0/lChXBKWDjJinMoYoz0LjmOExtsRqW6hSwPVMU
	5202OsclzvJVWJNU8iwSIdYI3iCf8fIq5ExMglCMsgtz7VGFoE70Ze1NdB8IBKaoqRXx
	qKtKACZRNd2ED9hh2oeBVNwUPXRjB0ZHR5ItqRfRsnFDiV6bdi0tCzI51IA6POG1H+Pv
	zHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wbiSQpdqZkTO2gJf3OfgkTUaSJedvrxQRI8CrDzlU1U=;
	b=JyojqgiF39CCGXWtlC2J5aQHLXfzB0crF0TvtluLuaob3DglrGaH8YgX2S3DNvnK+T
	djKphvVslMawn8F2Zrc8UBGscowQDvvPJpU7e/Met7Mrrf4AJIdyones58xZiCUgXLrP
	BQ4BlpSwXFHYd9F2aayJDfyW69HoxctczbnkopjbGY9/my2p5faArLkyNVY64W7HHYwB
	Q4YtsBZCpLCJPO2/QhCa60nKwx0DHZyiF48XWL2Sh94VjzcfJ2VK434ndnTIOIk+9HLF
	cuM8YS/FFaJGylfpWHk8UQxuSnKWb41XH4Ck6llyrcmwBAWLvszR164taadtUAEFBT/U
	xZHQ==
X-Gm-Message-State: APjAAAWSbFFvYLWQRbzRWATZCpZI+QUAHWGT41nVJ40ogaCiHTTfKPD3
	0GmXCBltHVQP5FK3W/O5psk4o4v0QyFVbC4xNXtmHw==
X-Google-Smtp-Source: APXvYqxUstmC1GahH1AlsYux7ubUMiGzrViDdWQBTDS3ktZDFhVnrbEl7A29l+D/aiWGIucmrV21G5kdRngfLV+ljf8=
X-Received: by 2002:a5d:8795:: with SMTP id f21mr4455247ion.20.1553076915006; 
	Wed, 20 Mar 2019 03:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190320093929.28688-1-lu.jiang@windriver.com>
	<20190320093929.28688-2-lu.jiang@windriver.com>
In-Reply-To: <20190320093929.28688-2-lu.jiang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2019 10:15:03 +0000
Message-ID: <CAJTo0LYBFgsLQX-+2YC_3Y+=NoKXfAMQso2ikkhSSE-G7_J1aw@mail.gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libsoup:add soup_uri_to_string_with_password
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
X-List-Received-Date: Wed, 20 Mar 2019 10:15:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Mar 2019 at 09:43, Jiang Lu <lu.jiang@windriver.com> wrote:
> +The existed soup_uri_to_string does not have password, add a
> +function to support it.
> +
> +Upstream-Status: Pending

Why are you adding this function?  Have you submitted it upstream?

>  # glib-networking is needed for SSL, proxies, etc.
> -RRECOMMENDS_${PN} = "glib-networking"
> +DEPENDS += "glib-networking"

Apart from not being explained in the commit message, this also seems
plain wrong.

Ross

