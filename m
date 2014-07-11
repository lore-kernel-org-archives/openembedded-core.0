Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id DB6E06FE64
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 19:46:12 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id wm4so1733294obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 12:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ixildadJQiejhNgTZ48apgDllNAgFKGcOACWZS3+zeo=;
	b=pQizcg8Swl+HKfjHnEb4cvB9JCKgquidiPA45Ga7g872YmoH1LINvk1P/didc4/pq6
	yyzEzfZsHWKgZkUoeQkHa78/PLNohOCKjHY+vQi4QUy56yMAc4NTZj/nJEdiHGt7Mk53
	3jBSf9eUA+o2pQzph9PhoXCODeeX/jBwgGDaZZZDm3BnqB8pk/UAEQzUam2fh8TMpygx
	sFYSZtTUcTCY+nv1NbWWwd76SoU0Sqjr5PiWsZEonMmc7kZhgwRTk1NjhueA30ntbVLN
	2crmFqvnulsLZICvAy+FXNq305dvJhlOq7M8BfeKIka8zMvt9UKmmIQw5YX/tweOobku
	KSwQ==
MIME-Version: 1.0
X-Received: by 10.60.63.195 with SMTP id i3mr1347500oes.76.1405107973772; Fri,
	11 Jul 2014 12:46:13 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Fri, 11 Jul 2014 12:46:13 -0700 (PDT)
In-Reply-To: <CAJTo0LZ0BD76LshHyfBMwKU0tgqS+3_QT1LZpLxbX4n03ZCmWA@mail.gmail.com>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
	<CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
	<1405084930.21289.7.camel@ted>
	<CAJTo0LZ0BD76LshHyfBMwKU0tgqS+3_QT1LZpLxbX4n03ZCmWA@mail.gmail.com>
Date: Fri, 11 Jul 2014 16:46:13 -0300
X-Google-Sender-Auth: nNJt4B7SOQ0_D1lWIZQj3mC4Oh8
Message-ID: <CAP9ODKq1kUKemgF-Ptn+Cz9==X0G5gq=dPavRNeXz75sNnwYnQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 19:46:19 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 11, 2014 at 4:37 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 July 2014 14:22, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> The anonymous python fragment should be fine, it sets the data at the
>> right level, the global recipe level rather than burying it in some
>> task.
>
> FWIW this broke the X drivers as they inject dependencies in
> populate_packages_prepend().  It's probably worth reviewing all
> instances of populate_packages_prepend() in oe-core at least as I
> clearly copied using that hook from someone else...

I managed to fix it here; if you need I can help you on it.

I am working on the other instances of meta-fsl-arm for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

