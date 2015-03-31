Return-Path: <elizabeth.flanagan@intel.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id A1E546013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 22:52:14 +0000 (UTC)
Received: by yhch68 with SMTP id h68so7849863yhc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Mar 2015 15:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ovTbDxAbkNTNu07ah8zSv3J/DgK0kOPdn+don5SKk+M=;
	b=b+KQc8EOrYS7Yy7ql9hxkEu4NbEwCMQP5uhytj+x84PCCT4Xs4O/TSYaLbdr5E6ROt
	OsP9ERN/RyFVHMnPRUOal5Hvlm3iY1jsAA4kh1F5GvCeGLrU119j6IT2uDbADv8vxkbn
	9IMS5NXcW1fURWjQMwaPeKimebsgqQGnLvCB5wB23kUef3o+UMbo7KGZpFB+AfCpmb+U
	tXLz/GB7mzgoc0Os3h71GE8lXURsWc+cYUDLf8iCrObrBo9a1ZHDjv3fRgSVoDRjoasP
	QU/XD3z4pwfT8KV0Osk8N4KZvT/L8QPM2mJdRAxab8RdIFTcj378iS3VvYIFfbIucX59
	tRIg==
X-Gm-Message-State: ALoCoQnuko8cpiLDeB0uIfidL8vPOnIJBdDA+xmZWGEH5+wZeRQNlRd5f2j0Kps6rN4GCs1GVgaz
MIME-Version: 1.0
X-Received: by 10.52.30.34 with SMTP id p2mr40580219vdh.89.1427842336181; Tue,
	31 Mar 2015 15:52:16 -0700 (PDT)
Received: by 10.52.124.37 with HTTP; Tue, 31 Mar 2015 15:52:16 -0700 (PDT)
In-Reply-To: <CAJTo0LZChMApmPzMEA-J+u8izy06O7fMJrU+3JaAN+ZbnSCv4w@mail.gmail.com>
References: <cover.1427832505.git.elizabeth.flanagan@intel.com>
	<1ec089080f95b9042d782b5e5ecc6628877acd02.1427832505.git.elizabeth.flanagan@intel.com>
	<CAJTo0LZChMApmPzMEA-J+u8izy06O7fMJrU+3JaAN+ZbnSCv4w@mail.gmail.com>
Date: Tue, 31 Mar 2015 23:52:16 +0100
Message-ID: <CAPhnLPBr1SJYGVmeW0VYg-Jv2hVnyWDjAQOg8L3K3dz-a6gL2A@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] distrodata.bbclass/distro_check.py: Support buildtools PN mapping
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
X-List-Received-Date: Tue, 31 Mar 2015 22:52:16 -0000
Content-Type: text/plain; charset=UTF-8

On 31 March 2015 at 23:31, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 31 March 2015 at 21:11, Beth Flanagan <elizabeth.flanagan@intel.com>
> wrote:
>>
>> We need to be able to map buildtools- to the original PN.
>
>
> What packages are prefixed buildtools-?  I can only see a buildtools-tarball
> and nativesdk-buildtools-perl-dummy, neither of which can be considered to
> have a "real PN" of tarball or perl really.
>
> Ross

Agreed. Looking at the two recipes that use this, I think it's
probably safe to just exclude packages that have buildtools- prefixes.

-b

>
> ---------------------------------------------------------------------
> Intel Corporation (UK) Limited
> Registered No. 1134945 (England)
> Registered Office: Pipers Way, Swindon SN3 1RJ
> VAT No: 860 2173 47
>
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.



-- 
Elizabeth Flanagan
Yocto Project
Build and Release

