Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1jWY-000731-Si
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 21:45:03 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 12:33:05 -0700
Received: by obceq6 with SMTP id eq6so2187523obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 12:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=5dlnhcg3mo7jSbrbrC06KBYDf7wvoa+8pCqlcimSY0k=;
	b=fIBBtFy5lM1/osBFhYRhAxlPvTu1BwNuWtXe7j2Axixy2E0oN7pKe0fVE0rll4os20
	4fFzH/lF5+gNnJrxn2Pd0mghoCZRhPM3kosgWFztEofGJyQhiwiSv5I68favj+WnnZV2
	C0/vlXJNtuXI26pF3Lgg4ey3yWME9Dw9kS0Fi1pSZjpp7hEpKek5+/W42VvUD1aWlled
	aJFN7AR/WnqqXja9SwGigSLRiUo4Vrb6ZuowVu3Hp6Z58vbnuxyYYi/GZpxzsoAr3p54
	6QIVnTF9YE3Cr0IrUYinfHId+BK/fBj+pyHChrku6AbJZgr2lgjZ1FlvSWmJQR4MZmRG
	NJ1Q==
Received: by 10.50.57.168 with SMTP id j8mr19796535igq.16.1345059184243; Wed,
	15 Aug 2012 12:33:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.146.103 with HTTP; Wed, 15 Aug 2012 12:32:43 -0700 (PDT)
In-Reply-To: <CAEsOVNd1DB0M5pNndxMLt4bdMwRCADPBLv9pw9pC_TELPwXAVA@mail.gmail.com>
References: <1343052252-4154-1-git-send-email-radu.moisan@intel.com>
	<lywr1uzguj.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<500E50C5.8000403@intel.com>
	<CABcZANkJhW+yER52vnbXSywxd-mhpNTPrFixL6R27thmMRmhMg@mail.gmail.com>
	<CAJTo0LYT5Jup6SXnmA62+Wy8sua94BdB_VwuHJ8erK1gshaYFw@mail.gmail.com>
	<CAEsOVNcVB5zp7rhN4LP7ANx3hDq51kFQt_0L=O5=YLU6Qp_D-Q@mail.gmail.com>
	<CABcZANkfFMgTxeQWzpKe2d2NqhMYaz27q-dnfW5m7-BJO2yygQ@mail.gmail.com>
	<CAEsOVNd1DB0M5pNndxMLt4bdMwRCADPBLv9pw9pC_TELPwXAVA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2012 20:32:43 +0100
Message-ID: <CAJTo0LYU_DpA9oywH9wCu9DHwJR-B7iJk6_nPiT=SAGGNSGVwA@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnumP9JfWwFbYlKCtM5GH/waGDJPwOtQ5eyOo+EtuySuQMOc4v4AvIqFhnxqBihjRmpA9AG
Subject: Re: [PATCH v2] kmod: Handle undefined O_CLOEXEC
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
X-List-Received-Date: Wed, 15 Aug 2012 19:45:03 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2012 20:27, McClintock Matthew-B29882 <B29882@freescale.com> wrote:
> I've been doing something similar and it's been working OK. -  I think
> we should apply Ross's patch.

Radu's, not mine.

Ross


