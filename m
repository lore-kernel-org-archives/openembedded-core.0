Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id BBEB97302E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 21:46:19 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id h10so58548958ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 13:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=BR8meOjAMbng81o39n4cWaDAW5GEbTInob71RW+9DbY=;
	b=gd5tn76WiDpO9dXNvGJmLHq9bLw+5zN2GkP6+oTzX3+90cRLaL53ESfHEpbRS+xmiF
	LohromJIwRnMz7bcf29mNnXRd0asFn0oTA4bIn3LyAbn5NiAMrGMaglCslkiq6nhgfOX
	IrfnbshH8YGKsUBd0uiMpK/KRyuoX68jaHwJFSOlRx4M1XiJIyKFWDFVo3L4AXOoe5Uw
	OLh4rtkA4hzBsPIHc127URL3WMInkLjVKBqLXhJok2ws9cKpz1haQ4j7p9i9GK/x7utn
	uLBXsDbVujQH1b8yawGf/OLuUmgHg3XTDvW7fLhqN2EnoNd4yBynsLriaVk4kwaAeulD
	J0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=BR8meOjAMbng81o39n4cWaDAW5GEbTInob71RW+9DbY=;
	b=XUsX62SnSb5GigbHFUnpB+1XgwePUveJhYliYHfx7AlhxxJPUrprPuhqVzNuLH92p3
	5De/YcMnCIJY8P0u24rF460JMHRRJ3vk1Lu0uQ/mr4xv4swr+wXcl2KYdpOamhZlZ06k
	LZhfQMr6C3PQSiKEYZ6ADXG9jmO552LTaBkL1375r7XaqsK+iMDccDs1h+vuH6BKJY13
	5hkCkZ8OBE8YmwIGJIojWW71pur85tVod0SFr4VFgYLHVididUCextXQuYYRcs/CJDjL
	ehA09t3ll10Qp6G0k+5nXXTyP40ZmdvL7l+OM+MYG1DWWoab8TUXVslOpttgR/ZaH1zP
	IVNw==
X-Gm-Message-State: AMke39k3FAuwUGayf5dXBUdQf57WVfat1pXIw5ZcfhlKvhsbpSW8Dtjkw40pgZWs3ixgxCoK
X-Received: by 10.36.71.18 with SMTP id t18mr10336178itb.104.1488836780662;
	Mon, 06 Mar 2017 13:46:20 -0800 (PST)
Received: from pohly-mobl1 (p57A5667D.dip0.t-ipconnect.de. [87.165.102.125])
	by smtp.gmail.com with ESMTPSA id 65sm5167714iop.21.2017.03.06.13.46.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 13:46:19 -0800 (PST)
Message-ID: <1488836777.7785.313.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Mon, 06 Mar 2017 22:46:17 +0100
In-Reply-To: <20170306195818.GB19275@linux.intel.com>
References: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
	<1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LY7pOtUWsbCJQ8_4A=Bxws04Sdfr1M-59fa6K5gdqJk-Q@mail.gmail.com>
	<20170306175010.GA18369@linux.intel.com>
	<1488828715.7785.310.camel@intel.com>
	<20170306195818.GB19275@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 06 Mar 2017 21:46:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-03-06 at 21:58 +0200, Ed Bartosh wrote:
> On Mon, Mar 06, 2017 at 08:31:55PM +0100, Patrick Ohly wrote:
> > On Mon, 2017-03-06 at 19:50 +0200, Ed Bartosh wrote:
> > > On Mon, Mar 06, 2017 at 04:49:25PM +0000, Burton, Ross wrote:
> > > > On 6 March 2017 at 15:31, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > > > 
> > > > > +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> > > > >
> > > > 
> > > > $ ( [ -h / ] && echo something ); echo $?
> > > > 1
> > > > 
> > > > If the -h fails then this is still going to cause sstate_unpack_package to
> > > > trap.
> > > 
> > > I don't think it will as '&&' and '||' lists are among other special cases where
> > > shell doesn't exits on error.
> > 
> > True, but if the clause happens to be the last one in a function or
> > script (for example, after restructuring code), then the return code of
> > that becomes non-zero, which isn't intended.
> 
> Exactly because of this I moved my changes up in the function in v2.

And someone else might accidentally move it down again, without
understanding the consequences. It's simply safer to be explicit, IMHO.
Not worth a v3, but perhaps in the future.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




