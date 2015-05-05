Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 32ABF6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 22:04:43 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so209947014pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 15:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fY1K+ff3iWKPH8gncpEmMu0/JMunGAkksEIzYunKTIo=;
	b=EtEuzmV3tQsc87RYS6eD22eViAsAXlRNbfuifrfjXb1PRCCVT8GnY7HlqF0nMbjUO1
	86AoUBapPc2h79jp7DRLDGnwJ7ikbmC+6rcfQjrM507U4m0AlGIS1ba/I46eaO38IW4s
	PX68Wtb7lK18TZ0/zqG6NYrWwDm5N1FptDwc9AI58gUFYx2Y7pNTYn7+BBBw2ux1ICAK
	vPFyuOsatkI/52nwAn3FEUwZOsu3SjxF1yymC4Alk9DXsqmlOonI3xoBS8y4D9sQ6kzI
	1aWQPP2WWJlm7FJzqlYl55YAilmAXZP9HZb6I3otanxJEiaW2KwNUlb19lLCisHiLShH
	OiDw==
MIME-Version: 1.0
X-Received: by 10.66.216.136 with SMTP id oq8mr5142779pac.97.1430863485105;
	Tue, 05 May 2015 15:04:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Tue, 5 May 2015 15:04:45 -0700 (PDT)
In-Reply-To: <1430775804-30845-4-git-send-email-bruno.bottazzini@intel.com>
References: <1430775804-30845-1-git-send-email-bruno.bottazzini@intel.com>
	<1430775804-30845-4-git-send-email-bruno.bottazzini@intel.com>
Date: Tue, 5 May 2015 19:04:45 -0300
X-Google-Sender-Auth: aYrQVGAy2GU8Xiqrn54fH80nR_c
Message-ID: <CAP9ODKoMD0hKJgALeHQPGTGxGANOOhwrMg7f=uKwEc+KN-bH-g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Bruno Bottazzini <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 3/3] systemd: split modules into packages
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
X-List-Received-Date: Tue, 05 May 2015 22:04:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 4, 2015 at 6:43 PM, Bruno Bottazzini
<bruno.bottazzini@intel.com> wrote:
> if one wants to launch a simple deamon, most modules are not
> required.
> He will be able to save space and exclude unwanted packages
> from the final image.
>
> Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>

I a fine to add PACKAGECNFIG but NACK the DISTRO_FEATURES change. This
is what a bbappend should be used for.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

