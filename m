Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.493.1589405706162691160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 14:35:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OkVwfOJM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id y16so1318493wrs.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dPXkmSm6SFbrEgPqM5sdqCDeoh1DlvfISHizTZMOCgQ=;
        b=OkVwfOJMjXb+MpiN71EJQhxv3N8/sFe9Mjz0R016m7oczHyoGMlXt7wQyNpwWoRYuc
         asRHK4U2BwH9NYu34H6d+GFYrgu2nnWSLlad4y7MincZpPveRa2WoPqeQC93fDNFvATn
         QWBOQd6Hk1+9J35f4Spph+3d2eOA/8oe3kI3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dPXkmSm6SFbrEgPqM5sdqCDeoh1DlvfISHizTZMOCgQ=;
        b=Op+ECY1ngrpoYYPfhv6inkp+G4/H9ljN9elDobkMoyIgmemAom5IKRI7O76FmRD1Ha
         WICa3X4gFcP4+sAsuTev1Cuqq2ZxSPrzih+58ojLzB0807RU/OH5H4IEFSFmu5Fh0tuK
         68+6eABRBsVQkPzQpSzNoqb2rM7ATVZ4Td2NGHkk90Sle9atn2YGyiV/DzaWZLDCmQ2E
         pb/6CAbJ9tZGSJjQRhuyTV4854xwKMm4FxBBsJKlJ9M9JYJLkYf4DemFSN60VGHO9N6t
         Enm4/9SbCww7r60P5gP5PEAAXWszM2afqelm0SsigJCc3uAksxaVk3kUSwRq9+9ACkyd
         c3fw==
X-Gm-Message-State: AOAM531KNejmUQBQKIHjYFyW9sW9NwrnTu5ibJgnP2l7aUcCWmzoccSm
	8c8X7x0VmsUBNBsC8d1FWsgtegBWSA8=
X-Google-Smtp-Source: ABdhPJykOEsIPudhW08xBRBobIUtDjYmahJNX6pVEfpRE8Ekymah4USblTPftSVGAd0zAuq6rJ4IiQ==
X-Received: by 2002:a5d:6541:: with SMTP id z1mr1513048wrv.264.1589405704585;
        Wed, 13 May 2020 14:35:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t4sm1237323wri.54.2020.05.13.14.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 14:35:03 -0700 (PDT)
Message-ID: <969caea61a7b4e9ab83b527655e94e589ae74d78.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] libva: upgrade 2.6.1 -> 2.7.1
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Naveen Saini <naveen.kumar.saini@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2020 22:35:01 +0100
In-Reply-To: <C996A1173CD66043A3AEC0C7B2C3906904DB50FE@PGSMSX102.gar.corp.intel.com>
References: <160D08561718B7AF.8752@lists.openembedded.org>
	 <C996A1173CD66043A3AEC0C7B2C3906904DB50FE@PGSMSX102.gar.corp.intel.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-13 at 01:14 +0000, Naveen Saini wrote:
> Ping

Needs rebasing against master please as there were other libva changes
recently.

Cheers,

Richard

