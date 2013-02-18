Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U7UYw-0006me-Rr
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:31:36 +0100
Received: by mail-oa0-f53.google.com with SMTP id m1so5937922oag.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 09:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=VRTPKf3lbGxW0z/KFF5CftAbjYpJRrOBw1ej+nVZkUk=;
	b=Q6ciY7Z9o0r//xBktaRnbFt0Ndf6oxsZU+YvG30T1uON//OtpBFkTrE//6a4PnSyah
	+hC0jxZdUpTpZYkcfBDeGW99dbvoL1FftuiraHfAa3f90+JI5u5K2k8wFZryD+0G9aj8
	ncDJTakVwXbqDL0rx2XzPMtN8SrMbPiWa1EEuAUNps4e5lEHM0swEtrxDKBZco5Bf/Oq
	WNP5DpD7Ig5Z37y/m8DIVcN4LYJLhbI5p4Yi4Bc71HSucNg9JhIAeaa3ORSgQuQVv9rL
	OVDS/eNOYtSh8CmxrKmCmif2QDLEdNxjiIFOXZwQOlG0YqDzPDFlJSg06y/ZP0NEN7u8
	76mg==
MIME-Version: 1.0
X-Received: by 10.60.19.129 with SMTP id f1mr1578005oee.82.1361207725962; Mon,
	18 Feb 2013 09:15:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Mon, 18 Feb 2013 09:15:25 -0800 (PST)
In-Reply-To: <1361206110-32463-1-git-send-email-ross.burton@intel.com>
References: <1361206110-32463-1-git-send-email-ross.burton@intel.com>
Date: Mon, 18 Feb 2013 14:15:25 -0300
X-Google-Sender-Auth: k4UXfHoqBH50jOnYbocnmtg0fBE
Message-ID: <CAP9ODKp9ewhW3uh6o_Up-Zki8CFsYqT3-ySntc-AswOwit+BFA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: merge udev-systemd into udev
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
X-List-Received-Date: Mon, 18 Feb 2013 17:31:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 18, 2013 at 1:48 PM, Ross Burton <ross.burton@intel.com> wrote:
> Merge the contents of udev-systemd, which is just the service files, into udev
> itself.  This split wasn't intended to every happen in oe-core.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Could we first discuss the problems we have in current implementation
before  doing more merges?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


