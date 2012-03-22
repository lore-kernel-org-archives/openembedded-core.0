Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAlKe-0003vE-NA
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 17:57:48 +0100
Received: by lbbgi4 with SMTP id gi4so1791549lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 09:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=FQYGRkKD4ZSlvXKJAIh8cM4Bt6rMU2m050hBxf9p74I=;
	b=TTA1NcYhZICfoFq2TbCkKmV71iaP40HUbM2RHb46BzpSQ0bvf/aWcuZ4PfypE2r3z6
	RZJIjSSlGxF8WGnylHD3BTDzXPa9cmZRyZJmCm7TosV2WFSDARpIR3y0IZg+EP2m3wLY
	7aOwkbHzQIT8WbbC4gu5hSg/yVyUBLgog6Zb8hN54hnq3raH8A8Tc9IhdjmksJqE5Oko
	R1liTs0axPLJVujqzkB8SlInHB/HOYxhgFyaY5Hk/ZL2CgbedeTQBgoBEiNAVm8Pv66z
	CTPwG1zMYtgUngS9LnKVt7HBtOkfvwxs9JiVjg/7qE2dhMM+AmJxXEEdAn9DORfF/wOq
	2REA==
Received: by 10.152.102.145 with SMTP id fo17mr6364268lab.2.1332434933586;
	Thu, 22 Mar 2012 09:48:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Thu, 22 Mar 2012 09:48:23 -0700 (PDT)
In-Reply-To: <CAMKF1soKyp62Q7K7xiAY-6YDdP+qezAC281-6qS3XYYf8emY+w@mail.gmail.com>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
	<CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
	<4F5531C5.30007@linux.intel.com> <20120322012358.GF6857@denix.org>
	<CAMKF1soKyp62Q7K7xiAY-6YDdP+qezAC281-6qS3XYYf8emY+w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Mar 2012 09:48:23 -0700
Message-ID: <CAMKF1soTe_6YB+eh_5YLojiAh9=bMP+hu4DUzi8SHSvABv0Nuw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
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
X-List-Received-Date: Thu, 22 Mar 2012 16:57:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 21, 2012 at 9:22 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, Mar 21, 2012 at 6:23 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> -DISTROOVERRIDES ?= "${DISTRO}"
>> +DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"
>
> whats wrong with patch I proposed ?

Richard

I was in same situation as Denys when I did that patch. I think
this could be a good patch to consider


