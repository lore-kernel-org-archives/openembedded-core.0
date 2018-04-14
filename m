Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6D944745B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 19:06:55 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id i5-v6so3856420oth.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Apr 2018 12:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QFxTaVxlkuAICpCIfFVzmheHZJFH5dNhPtv5Vp/Mr5Y=;
	b=pjxIuHcevj6x1MznL6EI2uwgg5IF9IEEM0k/vmpt4I5djpZmbyDeDgdy279XWF/t1L
	tnyGT1/zBN+ecvl8KiseXUFq/dsFwrVGFJGrEE+CgeeyXHiQBqjRnqspSZiqfO8iv5pf
	c3tpxFIt/2CPgd0mzaveKcfwp0xoTx/GSxBRAnPQEJhB8dxiITjJBK6hbyPYgTT2D35p
	ebShhpPv/eT7Chx1TCPMa1jmLxI8sYPDROnL0vKANfksjfekNOHuMu0EAsDPHH/anNI+
	5gXlvEtXYSMJQsSDqaQiqr75wie+7KSzShb8y8k9/7rlfT0JV/2Tdr5hdGCPojvDmYJ8
	2JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QFxTaVxlkuAICpCIfFVzmheHZJFH5dNhPtv5Vp/Mr5Y=;
	b=UQHeKXUAB/lQ51z+C6c8nRTeN1ReRW6SaPU0sAk6NrHxDG3XfITX3/r8Bx5swW4ZGp
	DoYlpvODjyz0PCmexVvlYVyR1yDyXLNi1SnsfyVs7mIyGF1SHL7U7cyoRlgqmiRAhyIa
	cOQF7V4M4veNP1PZ+vUcwJ11rbhMuIjXkMdEYhhW1ozMOCXBgXC2H7nKnc6j18YW+dZg
	oSW4JK3BrZTKV+ybjCknB2nO1ltPlZ78v/4pdufTeNISrA/u0tEzt9KsKgSnFRpl1Um8
	4YMt3+xLBxq9OBLUNMNsYeFcHD2NClp7MYqT0EnnvZ4+zsX5OHWme+uDNMWp8f51cS/v
	Mc2w==
X-Gm-Message-State: ALQs6tDyeUW/uZ0Q3DT/PzWvGnbMOprTox2ySO3PV0Ex6c4q+3h3s9qE
	6EopVL+rxR8gHyQ4QIo9iY0UXEhLn4g+UhgrpCI=
X-Google-Smtp-Source: AIpwx4/QRU/McA58zDoAGDDB1k9WzybLwKWbyVmmnbC+a7yrBOskNnZ+ul9tLFGzD+k4zhJeEYkL3AFTpKI9VkNR07Y=
X-Received: by 2002:a9d:454c:: with SMTP id
	p12-v6mr2702551oti.352.1523732816167; 
	Sat, 14 Apr 2018 12:06:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Sat, 14 Apr 2018 12:06:55 -0700 (PDT)
In-Reply-To: <CAHUNapTBgJgaaY4egm3rCFZHLpHKFbfSXK-PZ=Cn-Antxe1_XA@mail.gmail.com>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
	<ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
	<CALbNGRTthOp+_T-6c_Vc3qmgMHTt-2ztyDiGbNEHY4+6UuW2ig@mail.gmail.com>
	<CALbNGRQT94ptEPAygj+Rm9vBm27yo=inbz+O6nR2gL_etkGd7g@mail.gmail.com>
	<20180414101014.4bcbbc31@host0.betafive.co.uk>
	<CALbNGRSAMPf02-vWKrcX6j_K-My=e+Bw4RTwHRDHF9qcxz2JhA@mail.gmail.com>
	<CAHUNapTBgJgaaY4egm3rCFZHLpHKFbfSXK-PZ=Cn-Antxe1_XA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 14 Apr 2018 21:06:55 +0200
Message-ID: <CALbNGRRdG3wK4=TnwaFsRgdJW_KOXPiH0MrGB4xpSuGGVFhOwg@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Sat, 14 Apr 2018 19:06:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 14, 2018 at 8:42 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> If everyone else is seeing issues, it makes me wonder why it's working
> perfectly fine for me!
>
Seems you have ncurses installed on horst that matches oe's native
ncurses. The patch description [1] gives details.

[1] https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kernel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch

Andreas

