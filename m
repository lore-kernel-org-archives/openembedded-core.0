Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SoGPs-0007lx-JN
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:02:28 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 09 Jul 2012 08:51:15 -0700
Received: by qcmv28 with SMTP id v28so6408936qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 08:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=BZF5WrwUFYN9Womv8CpIdFzOWeSWbE8slYOVV3Gr9tU=;
	b=Qd0l9Wy4idnJqPpuu6C5q2OPAoFqWpXGDHi2zM1grqVtzgG/Ww1dzR19adbKaEpQ51
	RbSDiKoxiiXF/8LzgnXrnzsebINneK1Dtag/mvSCgvbP3HHjRns0ryawZnAvaVtfL5Ag
	+Y3F1aRw/Yi3NeIf7+88uvwTL1WkLsWjSry/ZpnHK8lZW0kl+AqLGeiO5RX26N1eD49O
	1fIT3d5j04PP6cV6QCrfvjH1ZO8dN24nCxRrVGtVeZApohYCbCYNVkcrAFgqPc0JlTzt
	EL8oKGMlrHvjNkVR94Wq6qGefYv8W6x2uRyHldp77VD3imDzsV6M1yLGgwtON8jtYjpR
	0FJA==
Received: by 10.224.40.2 with SMTP id i2mr72449679qae.62.1341849074641; Mon,
	09 Jul 2012 08:51:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.16.207 with HTTP; Mon, 9 Jul 2012 08:50:54 -0700 (PDT)
In-Reply-To: <28d8d0e8e16b46aa79fda0296f5c97c1af5b96af.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
	<28d8d0e8e16b46aa79fda0296f5c97c1af5b96af.1341802889.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jul 2012 16:50:54 +0100
Message-ID: <CAJTo0LbV6zPpY7b0fpzjXigz-Zxae52zkW=H1gqEQ7+HqU=pQg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk8STBdy7DfEsRnptzdMi7j1ALE1/ZGUdI4Ek+tx99Wqx4vHJAsA3Oee+YHaTwLYRSzpVCO
Subject: Re: [CONSOLIDATED PULL 11/41] gthumb: run make install in parallel
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
X-List-Received-Date: Mon, 09 Jul 2012 16:02:28 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2012 16:47, Saul Wold <sgw@linux.intel.com> wrote:
> I can't replicate the live lock in my own testing (8-way).  If it comes back
> we can revert this and have another look.

RP managed to replicate this on demand and now I can too (outside of
Poky on Debian too).  Please don't merge this.

Ross


