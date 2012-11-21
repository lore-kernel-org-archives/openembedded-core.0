Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbEW0-0006ff-JH
	for openembedded-core@openembedded.org; Wed, 21 Nov 2012 18:55:13 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so178316pad.6
	for <openembedded-core@openembedded.org>;
	Wed, 21 Nov 2012 09:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ODwREw7MSUNU2DRDvEIMJxXd9GtXYUHfHDlqompwQOA=;
	b=aawQRnA9oPxVdqg7ebVEdbYQcRh4kqU9zM2i27ZPYWZlzYlhvx60lzik4dELAkUH1Z
	R1MTyj3EuPYilgLezobUqN/hqLBh+DTpWRBCsX4AmVvAUyZ/ooHEVmBiwxUV9zgFrn8i
	hIcDtsSiaWHaWpEJY2H+bjLd2OoI5ucYE3fLTFlrAs+YQ1J+6YkK58j6goC/8IIWAeEA
	ADrWbjMAh2IuFidvcTEIMFd+LWCtpD9OHH76B44+2HrT+IIGoDAJhs6TWIftfKEKUEj6
	d3x83u8muV3o39PVliq6Y+ce9IPNVbdUGQ465/6XuWy+qhhkRMrPoPm/oc9j1Zawc6a2
	gm7w==
MIME-Version: 1.0
Received: by 10.66.80.194 with SMTP id t2mr19299877pax.43.1353519666533; Wed,
	21 Nov 2012 09:41:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 21 Nov 2012 09:41:06 -0800 (PST)
In-Reply-To: <1353518473-27252-1-git-send-email-philip@balister.org>
References: <1353518473-27252-1-git-send-email-philip@balister.org>
Date: Wed, 21 Nov 2012 15:41:06 -0200
X-Google-Sender-Auth: BQcl_yKiFOIb4bUe7I5k8W7qmUY
Message-ID: <CAP9ODKridD+oPtsnA_hvsQU3rj9wBU38gSZi0XqmQnnbSh9Gdg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Philip Balister <philip@balister.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] insane.bbclass : Disable tests for unsafe references in binaries and scripts.
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
X-List-Received-Date: Wed, 21 Nov 2012 17:55:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 21, 2012 at 3:21 PM, Philip Balister <philip@balister.org> wrote:
> These test look for programs in / that depend on programs in /usr. After
> a brief discussion in #oe, we decided these tests should be disabled so
> we can focus on more serious QA issues.
>
> If you are working on a system where / and /usr are on different partitions,
> you should turn these tests back on and resolving the QA warnings.
>
> Signed-off-by: Philip Balister <philip@balister.org>

+1

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


