Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id CF8E5723BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 16:52:33 +0000 (UTC)
Received: by lbcds1 with SMTP id ds1so35255321lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7XESLDtJECGXSQSqWVJI2h1BSHNXoaskweSIR2gQXT8=;
	b=MrhfELlmzjn/t9N48IDgdJMDaR40uRizwQMAY5MxeaFf8tgJ/8KuKUEvBzAw1I8IAI
	KrRrwQNTNQ+4NfIZuorl5G5u+dXlMFpML+2icsOXipUjQl8+KazaRtLGmiqTs4fbc0jb
	43+1NpTnDhPzUsAtzHvrRy2TGsUBoJj03AI1o7+WFZ+873LZ6vi1Qis4CbjnfUwzoxv1
	cwmR4KHJXp0hYHVU/YWb55fsxfhXqFHed/PN4iRUHkIgNb08JWQSh7mNKo9dm6sOAnwp
	mfNvgGt6SOjF9rAWFUm1W5Xvkpf0o3gSaAB6SWELXy0fgum7WBrPBtEAwOmCI9rwjP9c
	pdGw==
MIME-Version: 1.0
X-Received: by 10.112.110.231 with SMTP id id7mr56284054lbb.28.1426524753270; 
	Mon, 16 Mar 2015 09:52:33 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Mon, 16 Mar 2015 09:52:33 -0700 (PDT)
In-Reply-To: <DA889C06-A8D0-4B7C-A790-E70A2C504614@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<73D5E895-8D8E-445E-B269-68F62A89B413@gmail.com>
	<CAJTo0LZvk3Y7ZuN1pX7ES2iGFThRLE_0w=w904xVVkupmCJULA@mail.gmail.com>
	<CAC1BbcS+CutVKhSgx16ii7c_eMrszoA3QS5itBa80AbWFN+RdA@mail.gmail.com>
	<DA889C06-A8D0-4B7C-A790-E70A2C504614@gmail.com>
Date: Mon, 16 Mar 2015 17:52:33 +0100
Message-ID: <CAC1BbcS2E_eNswi_C2LytNfkKPSOnyC4E_w_6WWRLZyhHdjOog@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 16:52:34 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 17:43, Khem Raj <raj.khem@gmail.com> wrote:

> patches are fine. I was merely pointing on the sweeping statement regarding patches should be always libc-independent.

yep.
IMO patches should always be applied and not depend on a certain
architecture nor a certain libc or the like,
There may be a very, very few legit exceptions to this rule but from
my experience conditional patching usually papers over low-quality
patches.

cheers,

