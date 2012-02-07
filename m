Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Run9N-0005Jt-RT
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 16:40:11 +0100
Received: by lbol12 with SMTP id l12so1625559lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oZQQlN8MRP20UE0JpsrRnjZ583g47zbPDHmA88jR/Y8=;
	b=qjcETMEAshghN8uGWU8i1P2kmirF2Q3iu3DYQEi/T3hOwevVm4DaFGo0s2wC7cnTuD
	z734cgKOiGzP8UUpOjc1J8+Of3A88/K7TBmNLOv/T8iyr1+Se9zAGxvjipFLAI8bGZrx
	JaW0NMfmMN5Xp9L731Vm+Z2mc8U0bhDrJBNDw=
Received: by 10.112.86.67 with SMTP id n3mr6395737lbz.29.1328628726252; Tue,
	07 Feb 2012 07:32:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 07:31:35 -0800 (PST)
In-Reply-To: <4F30DC16.1050506@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 07:31:35 -0800
Message-ID: <CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 15:40:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2012 at 12:08 AM, Saul Wold <sgw@linux.intel.com> wrote:
> | /bin/grep: /intel/poky/builds/world/tmp/sysroots/qemux86/usr/lib/libz.la:
> No such file or directory

thanks ok I did not catch it with sato image build. which package is
failing with this
error.


