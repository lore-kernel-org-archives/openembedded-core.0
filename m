Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPv0i-0000N2-0T
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 14:52:08 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1149110pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=h8xcq9P71o8EhqUOwjARAqwJMOJUAeY3yrozz1jrFzM=;
	b=yAMRi5oNoI+OezehFUmqGChSr+0Bv5QxKO1V4TdkA8fM+9tXc59D2abytFOFxQ2WfM
	fAt6MT85oWUcaSSw3iqXceGpJtT9SMVoTF2r9DQw/ckN675yS9rkReHl99wfKrzsdW1t
	BsPpZ/PLIgULNWAXQzrAfEcH+RLXbaQDfCngMEYqJMkO3r5xy2IktnTTHbcLKS3rH7e5
	rOWpMVIJKtAIUf0uh5FIK6fbnHgAjhUpmm5xkGKPMsK1uatP43LCOHrqfidVFz0CO+XU
	7BBSNPmwFX1bpC8CawzAoh+ttMwV6psG+lNbrbYdV+UgIAM86V4glHk22WKW0s5mIdCs
	X3lw==
MIME-Version: 1.0
Received: by 10.68.129.233 with SMTP id nz9mr21626320pbb.136.1350823124010;
	Sun, 21 Oct 2012 05:38:44 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sun, 21 Oct 2012 05:38:43 -0700 (PDT)
In-Reply-To: <cover.1350769062.git.andrei@gherzan.ro>
References: <cover.1350769062.git.andrei@gherzan.ro>
Date: Sun, 21 Oct 2012 10:38:43 -0200
X-Google-Sender-Auth: nbsdsLpf4h8H-gP7voKpawG6KOI
Message-ID: <CAP9ODKoN9qSV5q6YvJ66FmEw4seww848JK4JREoynUgAQEj4bw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] FIX #2431 and other opkg / ipk related fixes
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
X-List-Received-Date: Sun, 21 Oct 2012 12:52:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 20, 2012 at 6:44 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
...
> Andrei Gherzan (4):
>   opkg-utils: Add needed python modules as RDEPENDS
>   opkg: Add patch to fix removing packages with recommends
>   opkg: Don't print empty PROVIDES
>   rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
...

I check the series and it looks all good; please split the formating
changes onto another patch or drop it.

Those formating changes are better to be dealt at upstream as it can
cause conflicts and the smaller the patch is, harder it to conflict.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


