Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 38F9760842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 16:36:54 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id e12so1480996vbg.29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lWBF2iMyihm4Jln5ln98M76LVZOjgn38+fVBBCrOwOc=;
	b=OUHgjSSn/pykNyRpLqjds/6mVR+X2DuxQgTR58AfCi2a+uJlJgdp53Wxu9q7l2f06u
	IbdeleCI5t6BMa5M7EEX/xSn/MdRxyJ1+wn0SyO2a5SUYSv0k36YkMRIJEsHMVB2o3hX
	YdgmyHxryMb7mTISin8GVVIXw3Pm+HAfwdy+UnCPGMj+oTO3Sno/yjfwz+4EecepezwE
	GUfAxrq3xCwoHOCGD6dR+QPrC/L8dZZNP2YwPrNk5GSTPDJsv/VwFoexoybvMAx5JfIK
	s4OqbphJ351s8bH17q2yCizAOWheKW/UoCTNg4bQOFKq8YoBeVNEqLIA4/saqF3DJe3w
	SPFw==
X-Gm-Message-State: ALoCoQkaJYtSDeXEKzyc0wK+4tWgN4HL7KzfnEGSzfrcyfgxFsEHosLGYggPhnILH7vCpmiFdAhJ
X-Received: by 10.220.186.202 with SMTP id ct10mr12470875vcb.14.1377189414377; 
	Thu, 22 Aug 2013 09:36:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 09:36:34 -0700 (PDT)
In-Reply-To: <1377155969-15087-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1377155969-15087-1-git-send-email-muhammad_shakeel@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 17:36:34 +0100
Message-ID: <CAJTo0LZkWSjgMEqfTc48fdB3D2cGaRzneD+u4rA33sXMAUR6hQ@mail.gmail.com>
To: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] [v4] openssh: Add systemd support
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
X-List-Received-Date: Thu, 22 Aug 2013 16:36:55 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2013 08:19, Shakeel, Muhammad <muhammad_shakeel@mentor.com> wrote:
> sed -i 's,/bin/,${base_bindir}/,g' ${D}${systemd_unitdir}/system/sshd.socket ${D}${systemd_unitdir}/system/sshd@.service

Instead of replacing path fragments, make the source file use a symbol
such as @BASE_BINDIR@ @SBIN@ etc.

(for all patches)

Ross

