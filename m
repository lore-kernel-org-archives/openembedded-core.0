Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 30F5E6F92F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 22:57:59 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so4704959qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d6VCUifCdDjoGSDziq4VjqU/KScZU8AwGco92EJWi2M=;
	b=MkD8OW6Wyav7swQjspmMNUfc93axnrwYh+Sk8GWUcqalz3+l4sTIkj21/FvqxZoDpY
	iRVmhOKUP/uH+PK2g8VJfwMrBZKieYWFV8pOY3WGjjq7bqJQCFcLnX8OyHFIjcqFUjHI
	f9uioTy1c5orb2aRZZNC2KCnVqu71cuOFIDYreJRkYOnbNItgGys9z31nKPFZMRdJRMz
	iczs1MnK3n3xZQGiToff3zMm0PVewT+3gMlVLpuMQmwB/Gj8Z0MwYVeRhwjuLatye5Zf
	czSNmj9PD0dbGEKFg+5nb2iudhIH72fh1d0CG/aRDgvI0J31mFBroxyDgSiie83WF6fi
	7SEg==
X-Gm-Message-State: ALoCoQks8vcfi2yfHyz+EdG/MgEEr+rW7vQAUukWeideMDhzl8uhlVOAoKNsI1x+lY45DLEseRws
X-Received: by 10.140.26.194 with SMTP id 60mr26776853qgv.92.1395356280661;
	Thu, 20 Mar 2014 15:58:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Thu, 20 Mar 2014 15:57:40 -0700 (PDT)
In-Reply-To: <CAP9ODKpoaUqrGUVB9PeaK1RQDsSxsMsxVim=RYNirmbxRY7YiQ@mail.gmail.com>
References: <1395246282-8546-1-git-send-email-otavio@ossystems.com.br>
	<1395246282-8546-4-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpoaUqrGUVB9PeaK1RQDsSxsMsxVim=RYNirmbxRY7YiQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Mar 2014 22:57:40 +0000
Message-ID: <CAJTo0LZU4fcQhTs5PjcLjOrZ4ujKMBw2=iMtLzOe1SbCFqRGQw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Saul Wold <saul.wold@intel.com>,
	Prabhu Sundararaj <prabhu.sundararaj@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] cogl-1.0 : Update to 1.16.2 release
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
X-List-Received-Date: Thu, 20 Mar 2014 22:58:04 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2014 20:00, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This update fixes some build problems we had in meta-fsl-arm. Prabhu
> did runtime test it and we'd like to have it considered for inclusion.
>
> Looking forward for your feedback on this.

The delta between 1.16.0 and .2 is pretty small
(https://git.gnome.org/browse/cogl/log/?h=cogl-1.16) and is entirely
bug fixes, so I'd be fine with merging this point release now.  It
certainly doesn't look like there's going to be a 1.16.4 release
shortly.

Ross

