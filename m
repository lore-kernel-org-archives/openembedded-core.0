Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 671987309A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 19:31:57 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 203so56173490ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 11:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=pEtX3wfKaCTypZ4IejEfuM5Dr196XQ87SDdezaizdYA=;
	b=q+JK0LMHgpkAn5Iw7GGlxPuma10MDHDgNZddwIB5l497hTD+APXPQvqfU1RsPiP/AD
	XVm4WtqUKws9xWavgdQvpr2XAL8th82YczLohxaeuL79mLc+rAcyLXtjUjRwg3RubqNA
	YcjZhuMLPr18rv57QlUwxVvrhheBsK9/EIBGdn+j/7HVezB8tu7mqUwi3PJ2Q8GRS9nL
	TmrRKpqiErAPaYUaT/6HN4EDRDNls8l4wpDUy2q66hkzut9nUejRyK+c3xY2JCPRDBuw
	rhP1Yo81dNgiuHFFhdmtaQdoH8vEn7QNgd/VScgek6dNcg+y4XaT3QkR9gkuJ3CWE/b0
	dkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=pEtX3wfKaCTypZ4IejEfuM5Dr196XQ87SDdezaizdYA=;
	b=aumjrS5OuoFQ4piJ0SiJnQx6c33dGk9lE45ZYAiG4TvtTlKUdl7isQ+lU77p0xMyJL
	cxTFph9yrZZsNePz57AhfjVK3mqw8tKvXnXan72ynk8Od6aqhSa5O3cTKXT4whMlIjFL
	XBavPOMmdjeMT2n+nfoXfJ8Y9GQTenGG/4nRF4bFXCKUzLC/aw5vNj0LjV/LWHO3H3r8
	YkfoCJjCeTXR+lskPbsZnE/qtJ4GoYthGrSX5c2eFs8g6CoPZuXFON8NpFyoCH8IuxZp
	e5MrZMpr3BMWUMdt30J1s7qbNTSRYBBBdy7H31wMVyv3tA2ER8xVOwPeclE9GEKtEIKd
	t4zw==
X-Gm-Message-State: AMke39k4yhDR/QZ2cDW7styf5nnWQTdCc3YmARYSrHwA6ssjX55dr+bKGB3PVJOGHAGeOQkK
X-Received: by 10.36.28.74 with SMTP id c71mr2969287itc.45.1488828719277;
	Mon, 06 Mar 2017 11:31:59 -0800 (PST)
Received: from pohly-mobl1 (p57A5667D.dip0.t-ipconnect.de. [87.165.102.125])
	by smtp.gmail.com with ESMTPSA id
	a129sm9061956ioe.15.2017.03.06.11.31.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 11:31:57 -0800 (PST)
Message-ID: <1488828715.7785.310.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Mon, 06 Mar 2017 20:31:55 +0100
In-Reply-To: <20170306175010.GA18369@linux.intel.com>
References: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
	<1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LY7pOtUWsbCJQ8_4A=Bxws04Sdfr1M-59fa6K5gdqJk-Q@mail.gmail.com>
	<20170306175010.GA18369@linux.intel.com>
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
X-List-Received-Date: Mon, 06 Mar 2017 19:31:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-03-06 at 19:50 +0200, Ed Bartosh wrote:
> On Mon, Mar 06, 2017 at 04:49:25PM +0000, Burton, Ross wrote:
> > On 6 March 2017 at 15:31, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> > 
> > > +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> > >
> > 
> > $ ( [ -h / ] && echo something ); echo $?
> > 1
> > 
> > If the -h fails then this is still going to cause sstate_unpack_package to
> > trap.
> 
> I don't think it will as '&&' and '||' lists are among other special cases where
> shell doesn't exits on error.

True, but if the clause happens to be the last one in a function or
script (for example, after restructuring code), then the return code of
that becomes non-zero, which isn't intended.

$ cat test.sh 
foo() {
    [ -h /foobar ] && echo 'fstab is a symlink'
}

foo
echo $?
$ bash -xe test.sh 
+ set -e
+ foo
+ '[' -h /foobar ']'
$ echo $?
1

Making the intend explicit with || true avoids that.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




