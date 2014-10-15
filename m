Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id EC66765D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 10:07:46 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id i17so645937qcy.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 03:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yfyu4wsWD7kv5zfJBRWOoJaQrgkQ4g5LT6WH6rnDo/0=;
	b=gy79cNK7/qqDUDATIWOfPR79pERRnLap/AjHZiuSlhArVoFbJW86yeYddlLFth8ufH
	pdT5hus1MQnVGTB6HYwOAL+KeHuiBPEJ3ZRrSb5ZiNKtJPlYnOtHXAnk5/+B+2o1Gs/P
	/VWS+CWSadTdEhW9mOO/36R2gddm9ZQ8SpQrnQWsOChrOEqB9+RSA4lNdAdqIolMnt+x
	+gX/Z+t8fpj2GyXDlPuheA6NvKSe1nH3uzMU6EL0yYXuIV1dSDhq+S722GsTuXE0HcQ/
	Vn7O2l9K70mSMZFt56q58ylgMO6X0iFd0mIfhFypfRftjGYLS2HtLBMEB4VdCZ/cPSMo
	6icQ==
X-Gm-Message-State: ALoCoQn7+Ly/g7Ch0fBvAdGR8wMzKP0jd39+d4Dh/1v3ae6w6hkHuOBmflVmFk64NuuRHhpTKfMk
X-Received: by 10.140.28.10 with SMTP id 10mr17307110qgy.15.1413367667808;
	Wed, 15 Oct 2014 03:07:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Wed, 15 Oct 2014 03:07:27 -0700 (PDT)
In-Reply-To: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
References: <3230301C09DEF9499B442BBE162C5E482576880D@SESTOEX04.enea.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 11:07:27 +0100
Message-ID: <CAJTo0La=7QNS53qZDgShj+9yr6Ge0hyk9HFAdS+Ue0bZAkck4A@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Truly scary SSL 3.0 vuln to be revealed soon:
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
X-List-Received-Date: Wed, 15 Oct 2014 10:07:48 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 07:48, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
> The advice is: Disable SSLv3.
>
> I created https://bugzilla.yoctoproject.org/show_bug.cgi?id=6843  so we can start to work with this immediately.

Presumably the list of affected packages is:
- gnutls
- openssl
- nss

Are there more?  Will ENEA be able to send patches to these packages?

Ross

