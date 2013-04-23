Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UUc1h-00019f-72
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 14:08:54 +0200
Received: by mail-oa0-f53.google.com with SMTP id m6so453500oag.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zDQNUUclOsiH1kcUkbEHjrAw6QfP9dQhUCM/TqlWUUc=;
	b=cJcUNJItAD/PgiPne1wsujCMpcl1e+vt5ANY3GrMg18f+8ghWSTAJmaZkuaxX956tE
	JBftXrRLaaZvPhPT+idl88CruPqLs1jzf/NPuLByaFzY9Uga5MWT1B5B7z8DxPfvblOX
	V+UQl3ajQkWu5kuPUFfUnQ0M1IPHafSR+fg126Bzn2ZMAFGSp+QjDtXK4dpU4JocKR+1
	eUCokig4Ie4jCnHaUpiOFZ+RaQXx7po26TymX5pm5gdbK4kaMgqhs1mND/AQX/NC/62h
	7oVXG7vEk/HcqV15gOy1WHEk/nIc/cJBlbpm2C/65jw3aLNdy6mzK3oWEh3QMWPHzaOg
	ovQQ==
MIME-Version: 1.0
X-Received: by 10.60.133.13 with SMTP id oy13mr2365956oeb.28.1366717868369;
	Tue, 23 Apr 2013 04:51:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 23 Apr 2013 04:51:08 -0700 (PDT)
In-Reply-To: <509f81736f95919be413293c2286c739da1de06f.1366673258.git.dvhart@linux.intel.com>
References: <509f81736f95919be413293c2286c739da1de06f.1366673258.git.dvhart@linux.intel.com>
Date: Tue, 23 Apr 2013 08:51:08 -0300
X-Google-Sender-Auth: R9RaLH5iQxyA1nmfW4vEG-kG2Xw
Message-ID: <CAP9ODKoKMQZwLFPKUkNLu_7UmvHFeXd0siuMxbFntMdznLgi3g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: Look for RTL license in the right directory
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
X-List-Received-Date: Tue, 23 Apr 2013 12:09:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Apr 22, 2013 at 8:27 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> The rtl-license package FILES was pointing to the wrong directory as it
> was removed from there in commit:
>
> acd3735 linux-firmware: Remove duplicaed license from rtlwifi subdir
>
> This resulted in a do_rootfs failure for core-image-sato-sdk for fri2
> with ipk when the linux-firmware-dev package tried to install
> linux-firmware-rtl-license which wasn't created as it was empty.
>
> Tested on core-image-sato-sdk build for fri2 on dylan commit:
> 789b2b7e0cca404ff8ba8ed5ba823d215e6ba5b4
>
> Cc: Saul Wold <sgw@linux.intel.com>
> Cc: Beth Flanagan <elizabeth.flanagan@intel.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I don't know how the install failure did not happen here but this is
indeed a fix.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


