Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9AAEB60723
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 01:31:54 +0000 (UTC)
Received: by wmww144 with SMTP id w144so3740532wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 17:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=vmIB8c7o7SFDeI4b63VHnYqmSoosxXzy84iEtfIlmeY=;
	b=R9aTjpdeNPddglXN1TbhDwDFPt0N2JjBcbPEU6lMvvrG98QNj/43f3E6/GYgNSPFeF
	0ikAn3d2gxZqaYfvnGsxcBH4IDJ3QCxkfdzpotuvPlnnNi5y0Zptx1nJX3mRWxIhEDXm
	68mynZAaOl0bXbJfom0OX01YGbrK9/rXF0vGty6NDaKv5BuMJ/GcdwUbuN+jyCDqTalm
	04k0U4JXK9k8o1mWob/tuEOqsPmKg0JoDuZlQP5Tr+LVxbEfnGwI+5nj/iSNuz2TyuIW
	g8Cdo/6U2I19bWQH6iSYLgVxzh6KPIEPdMp5KbtZsJTiZb2x2aWDi79592aAThQz+kqx
	xLew==
MIME-Version: 1.0
X-Received: by 10.28.177.10 with SMTP id a10mr651188wmf.4.1448501514923; Wed,
	25 Nov 2015 17:31:54 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Wed, 25 Nov 2015 17:31:54 -0800 (PST)
In-Reply-To: <AB05D454-7DF8-45A1-9222-AC42E74CAD2A@gmail.com>
References: <CAJ86T=VBh-TsnaSyNVSxmbEJz7TbFcDmNBVP4_4PhXB=YMrm5w@mail.gmail.com>
	<CAMKF1spXxarTUskBgB6ABdL-yn4wSm1cOZSBKdCpyxQzDg_a8g@mail.gmail.com>
	<CAJ86T=X_r_OU1RfN8nYJAJSYXwqEgvK17Hn87_+AfoGQAn2ocw@mail.gmail.com>
	<CAJTo0LbLQ51w5+MDkXKyFvDzzz=8UFjDi-s=JyHy2WoFFx2y2Q@mail.gmail.com>
	<AB05D454-7DF8-45A1-9222-AC42E74CAD2A@gmail.com>
Date: Wed, 25 Nov 2015 17:31:54 -0800
Message-ID: <CAJ86T=Ui+0AJ_OJ_w_hJgKk-ofM7KjnEpZ6LUbZ2o3J1c7_VGw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: vmdk images with musl libc
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
X-List-Received-Date: Thu, 26 Nov 2015 01:31:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2015 at 4:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Nov 25, 2015, at 1:56 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 25 November 2015 at 21:40, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> So would it be correct to add exactly those lines to the oe-core mtools
>> recipe?
>
> Yes.  Pretty much every dependency on glibc-gconv* should be guarded with=
 a
> libc override of some sort.  There's an open bug to give locale packages
> virtual names so this isn't a problem anymore, I should do something abou=
t
> it!
>
> I have already posted this as a patch along with my musl patchset for
> OE-Core ( which I need to send v2 addressing Phil=E2=80=99s feedback on t=
he series )
> here is particular patch
> https://github.com/kraj/openembedded-core/commit/11c054232722c6a96fd54f40=
f664da4a754fd342

Yes, sorry I missed that!

It looks like you only updated one of the mtools recipes though. Could
you update both in v2?

> Ross
>
>

