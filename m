Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RzwzB-00079h-N1
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:10:57 +0100
Received: by lahc1 with SMTP id c1so8263343lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:02:38 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.122.74 as permitted sender) client-ip=10.152.122.74; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.122.74 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.122.74])
	by 10.152.122.74 with SMTP id lq10mr22630712lab.7.1329858158316
	(num_hops = 1); Tue, 21 Feb 2012 13:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Cg7fo66t0jJNTIgAdg1muEIgNBHja/k5xD/gNrGKsyU=;
	b=ilShu69LEqtLOqIRYP+fNL+CDvvXIpVVRnPYqTf6O3ydw0g8jSk5ifR9iNZcu4L2cW
	Bzdal1KqSWQnqJDkS3PRkIMRgNRbiUT0ka3aI+GB4hPA2F1elVP6lP7lQevtDIAZ2tG2
	RuMWKNjnYhQZD22TKZJTZOGF11gPFZxiasffk=
Received: by 10.152.122.74 with SMTP id lq10mr18905332lab.7.1329858158262;
	Tue, 21 Feb 2012 13:02:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 21 Feb 2012 13:02:08 -0800 (PST)
In-Reply-To: <4F43F9EE.5080608@linux.intel.com>
References: <cover.1329456260.git.yi.zhao@windriver.com>
	<ea7342b8cdd7a0f9c49253f9e063ab7577f04038.1329456260.git.yi.zhao@windriver.com>
	<4F43F9EE.5080608@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2012 13:02:08 -0800
Message-ID: <CAMKF1so0r+8CUMCAQ0Jz1wbP=jSjqnZGuSjPawn5FtJGOQjBjA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 21 Feb 2012 21:10:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2012 at 12:09 PM, Saul Wold <sgw@linux.intel.com> wrote:
> I think you need to have a RDEPENDS on at a minimum for this lsbtest recipe
> since it relies on RPM to install the packages.
>
> RDEPENDS = "rpm"
>
>

that wont fly if someone is using opkg or dpkg


