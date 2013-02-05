Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U2kui-0003K6-Ny
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 16:58:29 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so286154obq.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=AjWOBl8CQk3cSLMREGyin6IxiFamUfaJ+51edg2BW+Q=;
	b=IeP7zWOxo2DZVzjd7mWbyL8bp0xKmjsQnTvtR/o5Vyq/THRl6KsK0EBhYhhtExF0AE
	jgKGM0BMEaLlVl7ocsSPFtpbilT/01O4D5VKiJgpcVggv5jTh8gTp4m44GMh03On9rVM
	Rgmi29T3Q/4lMQB3iXJCCTKYCQ8u/sh0C35BddykYGEQpj611fEiKuZuynEEWAk6sg6g
	JeIlxYp0N8i+HIdsHOji500rB51GJbByxT310uR/XePhWZ2AqAAoCwwCD88ZEKpehCIo
	MJ+gbejzDIrU2W8GmkY0FgNovD6k3L6BPMYCHTCl8snPP2oaxIICAQ1OMei/x4zpSBHc
	66mQ==
MIME-Version: 1.0
X-Received: by 10.182.3.163 with SMTP id d3mr18525764obd.27.1360078958550;
	Tue, 05 Feb 2013 07:42:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.2.197 with HTTP; Tue, 5 Feb 2013 07:42:38 -0800 (PST)
In-Reply-To: <CAJTo0LYQAy5-RzTU4aYN0jqAX10cbMNSUPu3i+CMBFo8G4vD1w@mail.gmail.com>
References: <1360066533-20693-1-git-send-email-andrei.gherzan@windriver.com>
	<CAJTo0LYQAy5-RzTU4aYN0jqAX10cbMNSUPu3i+CMBFo8G4vD1w@mail.gmail.com>
Date: Tue, 5 Feb 2013 13:42:38 -0200
X-Google-Sender-Auth: djKK4nlMLJ3c8E_68-5v_Ff0P_A
Message-ID: <CAP9ODKqnZtMCkSpR7m7CJ=Z5YvERgTX71AdmuYOU16BUv9PFGg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: Package systemd service in -systemd
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
X-List-Received-Date: Tue, 05 Feb 2013 15:58:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 5, 2013 at 11:54 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 5 February 2013 12:15, Andrei Gherzan <andrei.gherzan@windriver.com> wrote:
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>> ---
>>  .../wpa-supplicant/wpa-supplicant-2.0.inc          |    6 ++++--
>>  .../wpa-supplicant/wpa-supplicant_2.0.bb           |    2 +-
>>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> NACK.
>
> Please don't add -systemd packages.  I've almost got a systemd.bbclass
> that I'm happy with, but if you must add integration now then just
> package the unit files alongside the daemons, respecting the distro
> feature.

I'd prefer to hold it until the class is out.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


