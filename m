Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UYCLG-0000Tl-N8
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 11:31:55 +0200
Received: by mail-vc0-f178.google.com with SMTP id kw10so1258490vcb.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2013 02:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=DvfQOjzI2DIJyMwrRf63/xxONbz8Hw8L6sU5uke8jA4=;
	b=j0PHRQhae2W60rEeH5A/lB/5PF1YMIsPYbeOQ7fhOlykcMmnJwNg8BiMPLTxreI0J7
	rc7bvyOiS/eeh/DZriFjaDaOfd9MGJ7C5z726RtPqCETh+yTwv6eW7qiNlIY83wuG34T
	1Dows1V7Idgmod/JNNlZHAiAE2ZsGVTWKkvDo/1ZlBcOPWaJH4m4TOn5FfdZvCvMarzX
	TpWAbzrL4mvOLwb6XG2sZJ4J0OnOCp9+f+ti4pR8rBUnr526AxoV5E+ybcefcR7c64eg
	JB+wgXJGoESfD/H2mOFUChDr+QJjMVCUO2f8QWn3fFfI2bMK2Wel9qAV9/uYVsPCrEVh
	F6/A==
X-Received: by 10.220.67.67 with SMTP id q3mr3370404vci.38.1367572435556; Fri,
	03 May 2013 02:13:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 3 May 2013 02:13:35 -0700 (PDT)
In-Reply-To: <5182AD8C.4080006@linux.intel.com>
References: <1367325004-7740-1-git-send-email-schnitzeltony@googlemail.com>
	<1367325004-7740-3-git-send-email-schnitzeltony@googlemail.com>
	<51816D8B.2020102@linux.intel.com> <1367513549.5379.133.camel@ted>
	<5182AD8C.4080006@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 May 2013 10:13:35 +0100
Message-ID: <CAJTo0LY-THPe1242wtLDJvFqSwNqgQJEvg5-P_RNxwum4CmC_w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkjupmdkJNBvxY3FZG1oK+OwQHGLeE5N6EEbnv7fGqGTkSGCWG0wSxTJRa94mhECr+/yAcC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH/v2 3/3] core-image-sato: add udev-extraconf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 09:31:58 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 19:16, Saul Wold <sgw@linux.intel.com> wrote:
> After looking at this again, I think it might be more complex, do we want
> the extraconf files unconditionally in for both sysvinit and systemd?

Where we want udev-extraconf, we don't care if the init manager is
sysvinit or systemd as they both use udev (just different versions).

Ross


