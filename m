Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id EDE4F6AEEF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 14:59:05 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id db10so1062671veb.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 07:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=J3f3KDtGEGDQ9DyPKrwpYnCd+wVrn40cAVgVE4Qhwuk=;
	b=BgA2b8iMyZFnH7SPamfUZIChims+i8h7wZ7v40UnDDEapHGCF1+a3CRSdWp0HdZrpA
	v97Dw+ZQlln8JKzFVljhUg8sFEti6S26Fc6R/4Jc/lUGruDax/kCSLDuQkXsfE9xWI1E
	9YJC49C7DmGH5iblxwocrw5a4NZ6YxvE9bU+JjIW5JZ92EAfhYfOQtoCiaYMz0SBpkj1
	693X+iMgyMvJlzSu9uf+aMeSKXCTccclnT9gfQWdcpwRxMO+ath2CqrQQsbQeHTdiszi
	bUBWWSGlRBabiGCID8FHIWIh4LRvOyXcYFjXZ77cd/UVi2oLzuD1/+Be2YzPtVckkRy7
	Fr+Q==
X-Received: by 10.52.163.46 with SMTP id yf14mr2766283vdb.58.1372949946704;
	Thu, 04 Jul 2013 07:59:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 4 Jul 2013 07:58:46 -0700 (PDT)
In-Reply-To: <11aefd86a570528092c6f4f5de1371204b1f30ec.1372933905.git.laurentiu.palcu@intel.com>
References: <cover.1372933905.git.laurentiu.palcu@intel.com>
	<11aefd86a570528092c6f4f5de1371204b1f30ec.1372933905.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jul 2013 15:58:46 +0100
Message-ID: <CAJTo0LbxsXLXfHZa91nUuWYBWTLUeqBzrfZENV910io98MnMZQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkHTjhKc6yd+/9p/b48g3H09sF1EDoawLYsaA6U3WmkqEnkpal+UoNoHyxXQQSrId6iwKEx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 5/5] shutdown-desktop: give entire path in Exec field
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
X-List-Received-Date: Thu, 04 Jul 2013 14:59:06 -0000
Content-Type: text/plain; charset=UTF-8

On 4 July 2013 11:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> +    sed -i $D${datadir}/applications/shutdown.desktop -e 's#^Exec=\(.*\)#Exec=${base_sbindir}/\1#'

Doing this in postinst is pretty nasty, instead change the desktop
file to contain something like @SBIN@ and run it through sed in
do_install.

Ross

