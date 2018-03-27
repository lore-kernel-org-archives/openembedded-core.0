Return-Path: <ross.burton@intel.com>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id BF581784DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 09:04:13 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id v23-v6so23704800oth.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1qSyTHqJFTL+tl9milmIZ6fUR7VTkVYH6t6CKjZsdp4=;
	b=a6gVMo3538oqIlQ8QkvYja3uKsFLnnTwu3St4zyWbIyB41U3iZ8zYpIikWov6yGLwO
	9P43iBZ/+kNs9Mgof8gAdV9zaGnBSEt55a1aAhx3vcHo3A2sUbRty6C9oNQpGkpzz23g
	xNOZNxxARuhEFuyJ5Q9CbZHP8ztMQmn42p/vDdS7Cs6yPamiFj4iGUn9C5OH+CA6Mi8+
	DoDzyzXUxgtrcZkRaudzqZnMQRRstWRQWysGiY0B0+UD40hXkM5X3nSxm/m5pbWkorfP
	PaaPKI+GviJsBE/yL6Xy4dllakO33EM5G7PpNbMcIqvEAFnkdEEEfGMlGDeZxsKHSZ+K
	/jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1qSyTHqJFTL+tl9milmIZ6fUR7VTkVYH6t6CKjZsdp4=;
	b=l1bEAd20MJttf15hM4y5ZjEbEIJLF54KIn8N1So9o5GYpzduMPdk3k7qUDpd+wZ07g
	+oCRpCkG6baTYw6xexM9v9S3Etw9/5tciBq9LW69GQS/0O5oSxiWEGGTvcDd2ZkKLqJB
	GRP3P16sxW3t+NpU1G2BYuAlNsWKcV1x2GtO7nypTI6EoD0/MJgQg23GVV2eKhb3BaNc
	eqgTiMCBEd3TddX+BHJEhEYpO+o21VCyGkBToEz+MSibLg3fKsRyjsLJz99Y8hJSsPZY
	4rg/XnDCzNJn+DKq8oLIzBgi2zNVPpCYF2LMvGzI0gXw/Cd/tpA0Gfg8Ukkdh0Ry2R5F
	INVw==
X-Gm-Message-State: AElRT7FLBSp7bubMnH0X53yoa/+k3Kxaxlvda/MdaRpGhH9vvS9bDGK6
	8MsWUllAV5xyNd4iBqIIgTppuYbITHnNO8JRb2uwpA==
X-Google-Smtp-Source: AG47ELttIKRobUUruXywBmA5djNP2ub8rKFcBgrPg8LBIDt/gfNQx2NGOdtTlamPny5O5sXDkB+usGjlE8kM/Srb6RA=
X-Received: by 2002:a9d:281b:: with SMTP id
	m27-v6mr20540784otb.89.1522141454717; 
	Tue, 27 Mar 2018 02:04:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.138.17.198 with HTTP; Tue, 27 Mar 2018 02:03:54 -0700 (PDT)
In-Reply-To: <CAEhQi8kBYvjB05pny3QWkbdd6c1=OAQhrTwCP15-nNsmhZOxyw@mail.gmail.com>
References: <CAEhQi8kBYvjB05pny3QWkbdd6c1=OAQhrTwCP15-nNsmhZOxyw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 27 Mar 2018 10:03:54 +0100
Message-ID: <CAJTo0Lb8jwMcuEwSwSpMQ_Sy-ry6f9DLmZyBeU6w-EB-it04BA@mail.gmail.com>
To: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about how to get package included in SDK
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
X-List-Received-Date: Tue, 27 Mar 2018 09:04:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The main problem is that protoc isn't in the protobuf packages, but
protobuf-compiler (as can be seen with oe-pkgdata-util list-pkg-files
-p protobuf).

Add nativesdk-protobuf-compiler to TOOLCHAIN_HOST_TASK.  You'll also
want to use _append instead of +=3D so you don't remove more than you
add.

Ross

On 27 March 2018 at 09:25, M=C3=A5ns Zigher <mans.zigher@gmail.com> wrote:
> Hi,
>
> I have package that require protobuf and the compiler protoc. I have
> included the following
>
> DEPENDS +=3D " protobuf protobuf-native"
>
> and
>
> RDEPENDS_${PN} +=3D " protobuf"
>
> The build works as intended the problem now is that the protoc is not
> included in the SDK. In the Yocto ref manual I found the following
> description for TOOLCHAIN_HOST_TASK
>
> "This variable lists packages the OpenEmbedded build system uses when
> building an SDK, which contains a cross-development environment. The
> packages specified by this variable are part of the toolchain set that ru=
ns
> on the SDKMACHINE, and each package should usually have the prefix
> nativesdk-."
>
> So I have also in by image bb-file included the following
>
> TOOLCHAIN_HOST_TASK +=3D " nativesdk-protobuf"
>
> The build passed without any errors but the protoc is still not included =
in
> the native sdk. It  is form some reason included in the target part. I wo=
uld
> really appreciate if you could en-light me on this topic on how to includ=
e a
> package in the sdk.
>
> BR
> Mans Zigher
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

