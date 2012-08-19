Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T38IO-0004i5-5z
	for openembedded-core@lists.openembedded.org;
	Sun, 19 Aug 2012 18:24:16 +0200
Received: by eekb57 with SMTP id b57so1148955eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2012 09:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=L+LUxcX6o/DMqgdT6evEY7YkOcNko0Z0ORDwss/6uH8=;
	b=ijAMgAB++8IU0NZRjph9fvOC2uB8FwvA9Zip09BgYTE+iU3ZHOPhpDXGWykjgzmkCI
	smbq8ZqnAyHFFD3NmZLrdN72D+RbVeceY4HcGNJgZ3q1N9XwnsAFvJUPpcfJJtbWLTBt
	ErfF1vPPH6hPlHojfVMKPdEhxPP+axjK5hQIekQuS5ewNnsLWJAC5F6CZfxPWTlnK+8K
	PjrbhGRCfz1aWBpvhhHH4e9a5yQO31UACZL+YJSP3gjCn1GhWRdg5y3QyJqSGjPqITA9
	/ynTDzkbeasgKEcPO8j2THhmSVjn4Hn3LPZ7wAMsER93QRydUqLsUiyEXNeAlKogdENX
	ZBvA==
Received: by 10.14.211.3 with SMTP id v3mr5003062eeo.43.1345392726885; Sun, 19
	Aug 2012 09:12:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Sun, 19 Aug 2012 09:11:36 -0700 (PDT)
In-Reply-To: <1345379671.27428.88.camel@ted>
References: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
	<1345379671.27428.88.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Aug 2012 09:11:36 -0700
Message-ID: <CAMKF1sqMj9C3-u3PVcx8eDsZ41336p2KhU0+y_L-RrQT6RmS3g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libpam: Update recipes from 1.1.5 -> 1.1.6
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
X-List-Received-Date: Sun, 19 Aug 2012 16:24:21 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 19, 2012 at 5:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-08-17 at 21:56 -0700, Khem Raj wrote:
>> Drop include-sys-resource.patch already fixed upstream
>> LIC_FILE_CHKSUM change is due to deletion of space in
>> COPYING file see
>> http://git.fedorahosted.org/cgit/linux-pam.git/commit/COPYING?id=1814aec611a5f9e03eceee81237ad3a3f51c954a
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../pam/libpam/include-sys-resource.patch          |   12 ------------
>>  .../pam/{libpam_1.1.5.bb => libpam_1.1.6.bb}       |   12 ++++--------
>>  2 files changed, 4 insertions(+), 20 deletions(-)
>>  delete mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
>>  rename meta/recipes-extended/pam/{libpam_1.1.5.bb => libpam_1.1.6.bb} (90%)
>
> I merged this, it broke the build, I hopefully fixed it:
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=91ece5d5668ee1adb5c5e3d757426a0d5187bd84

I did not encounter this in my builds but someone did see

http://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=d7e6b921cd34f7ad8fc4d05065c75d13ba330896

backporting that will help I guess ?

>
> Cheers,
>
> Richard
>


