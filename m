Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 505EA7713C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 23:34:53 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l66so139958955wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 15:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aZrudKzVar2XKKpTiqVMstkdM5muI2KKTzMvJHsWSsM=;
	b=MVI2owkUHkvauD1jIpXDYQi6q/2TZgbgl6cURArw/ZxkHYzUwL5ZoL1yUqZZRMAgG8
	rbVtPuAoCDLJdE3s4jbWm/vNhtlKui1Z67oV92hSBnMsoc7Z99TSPbq14Ghf1NfQdbSB
	TV/BamYAWnx1+Adn7Q+rUKnE2RJ+656oXxyC2D3964WTPV1+uJe/euZVqXXs9+QRHyUf
	NYnoN87qIAuqYwPxxlecDeXKdURdHa3eUaJwCu2tSbFQRlSpBz7BwAbcDLx0uh0gYLBv
	74mYj/URc+P6PICKLa1zd3Zxg7CkpsvW3ga0hPjCOSGGURnfB02Xy+BNRSoV/ies8xYZ
	2s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=aZrudKzVar2XKKpTiqVMstkdM5muI2KKTzMvJHsWSsM=;
	b=HK3VgvZm23qzn4wi2bdZnLljC70yOfYy6Aga8oTgIMRO8JvAnVTHPc+fe3EtCVq7l3
	Q1ykSGT0WyBRWQJpTMG9GxpEeZIvKwlu0K39hJ1P5XoCcK5HABNWRAqq0GMLVVb5c0+b
	ibtGCPJYSFc8GRURqYPZdKSkV/hamt570yr+80qbqBCbLNhnVLWNoc1GoIuWODGUXQP8
	T3FTfJjJGD3VhSkhUKAI48iFv3OyrexRHSr2sM5eXmWcp07uN+ZdHMl3B9/Ewhcae/ZV
	NviAR72xxr/qRg9QRhAMUhUfmt5Az/qAG+E/XIYQhhAMSZzepJIYoFbvD3NpGH7CHK70
	Uj1g==
X-Gm-Message-State: AG10YORMCKjttBUT6EdmQk19OLPYEd9uP2rv9l31Er3eYOCBGza90KMqFs2gUak+alV8FIVNdm5LKwt72GI5NQ==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr31230090wjc.3.1454456093615;
	Tue, 02 Feb 2016 15:34:53 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 2 Feb 2016 15:34:53 -0800 (PST)
In-Reply-To: <56B1378D.7010905@linux.intel.com>
References: <56B1378D.7010905@linux.intel.com>
Date: Tue, 2 Feb 2016 15:34:53 -0800
Message-ID: <CAJ86T=XkXAw=sgCjAaq2E7Ly0xGTVcRKONfw0cyy8LjKcnQwyA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: openssl parallel make error (again)?
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
X-List-Received-Date: Tue, 02 Feb 2016 23:34:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 2, 2016 at 3:11 PM, Jianxun Zhang
<jianxun.zhang@linux.intel.com> wrote:
> One of my builds hit parallel make error in openssl today. After some
> search, I guess it could be an old issue and see parallel make has been
> toggling several times around this problem in openssl recipe in the history.
>
> Is anyone or auto-builder seeing same issue recently?
>
> | ../../libcrypto.so: file not recognized: File truncated
> | collect2: error: ld returned 1 exit status
> | make[3]: *** [link_o.gnu] Error 1
>
> BTW, my build is based on poky master and meta-intel master. MACHINE is
> intel-corei7-64, though I don't think BSP layer is related...

Gentoo have this patch for 1.0.2e (which applies cleanly to 1.0.2f as well)

  https://gitweb.gentoo.org/repo/gentoo.git/plain/dev-libs/openssl/files/openssl-1.0.2e-parallel-build.patch

> Thanks
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

