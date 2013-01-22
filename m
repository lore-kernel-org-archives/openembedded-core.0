Received: from mail-ie0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TxmKc-0003yt-UF
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 23:28:45 +0100
Received: by mail-ie0-f182.google.com with SMTP id s9so12588043iec.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 14:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=Xd+N4daFkl7aVDS/RD6PGtUT9exxiS2ryYrBkrcNOBY=;
	b=dUa2dv8ft5PPTYIi+9pybjvxE+AtTPn+xzPIVDhISAv8W3/570ABfODqsj4yDPwKxJ
	gLOr5UP3ON5AijHIq8n6ka7KTq6SxufhNH8uQC/NN7AgaIiy/SbplLvXYDtQCqzKUsWD
	ilYtDlT3GkDvpH3ugg4/77n0fPebOZA6bop3mrBnc7sI9UQ0LQCR0SWrW+4gvSCdzOWg
	270DuUCxgf8aGlDhcRY7ltZqRpK/CoeTJno49gBd3MGc48/DjX0b6JHUMwISoV+JlS4Q
	2Zxr1qFjls1g2HFEvDtadsEHjO2s4eaWs0PHJLVmflFWM7+esA7ZdE4zdtD34bpE9Duf
	TsYw==
X-Received: by 10.50.150.239 with SMTP id ul15mr12944909igb.93.1358892788049; 
	Tue, 22 Jan 2013 14:13:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.18.169 with HTTP; Tue, 22 Jan 2013 14:12:37 -0800 (PST)
In-Reply-To: <50FF099C.5080203@linux.intel.com>
References: <cover.1358634922.git.raj.khem@gmail.com>
	<613da782b369ba5424b5619b4315ea34e645d53c.1358634922.git.raj.khem@gmail.com>
	<50FEFA22.2090008@linux.intel.com>
	<CAMKF1spq_du8mB2nAvqcYQG7izORFHTkZFTBhUCE3SrJZ3KU2Q@mail.gmail.com>
	<50FF099C.5080203@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Jan 2013 14:12:37 -0800
Message-ID: <CAMKF1soo9U1WiGG8S4uyP0V-k2wvHDOvWiX+RsEd6SiPRYH3wA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 22:28:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2013 at 1:50 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> I assumed that would be the target eventually - is that not the case?

yes when we have tested it
However, I don=E2=80=99t see any other better way of coping with the case w=
here we
would like to use gold as default linker distrowide. One could cook up
a patch for kernel
to demand ld.bfd always like I did for uboot but we have way too many kerne=
ls
to patch. I am open for other suggestions.


