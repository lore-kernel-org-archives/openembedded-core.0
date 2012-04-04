Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SFTey-00042h-72
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:06:16 +0200
Received: by dadz8 with SMTP id z8so518792dad.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sezNbE8rdw0K/lJOPAqHWEVqeKHxgDQaefM8eNs1MUo=;
	b=JmCTCJlZxNLF7V7+t9iYPQmeklRZFUhSbWGGbu/LU/KgpTFt7exQnUC8BPOLgNc6gD
	2ioVBhJhsUAviTJqWu4PxgYYpjMVB0AJZUe/mBZZVbG0JvTCokjDZIJ8quI7tIp2seWu
	Ds3NaowiZRItOLJP8tKzuv0hnqUONyg7IfVu5wYwpgQIDV7T621cGUWWcAN4iVAZ/Pam
	3jcrcp3aeAFtYFo8il+Wvze1a08OqiNzUnWa7nkGVIdQgwodionIXGjTkcTIntNDvzQD
	nvapCPHQ9nwGWK1NM7UqfzPJ1EePwCULfH5h5bHm2S+er7aMhGL00zgDmeRK0Qupt9vV
	qbWw==
MIME-Version: 1.0
Received: by 10.68.135.69 with SMTP id pq5mr38737942pbb.30.1333558624444; Wed,
	04 Apr 2012 09:57:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.60.161 with HTTP; Wed, 4 Apr 2012 09:57:04 -0700 (PDT)
In-Reply-To: <0d5a88036c74a354a62e13cf83d05f99fca8175b.1333553396.git.paul.eggleton@linux.intel.com>
References: <cover.1333553396.git.paul.eggleton@linux.intel.com>
	<0d5a88036c74a354a62e13cf83d05f99fca8175b.1333553396.git.paul.eggleton@linux.intel.com>
Date: Wed, 4 Apr 2012 13:57:04 -0300
X-Google-Sender-Auth: 8gTAELgcKUp87cB4ingz9LEWc4k
Message-ID: <CAP9ODKpPhyGJ-Jbu2JUGyzsYpAVAkOjTQGrvu3CN7p0JXb8cUQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] classes/image_types: add IMAGE_TUNE2FS_ext3
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
X-List-Received-Date: Wed, 04 Apr 2012 17:06:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 4, 2012 at 12:32, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Add a variable that allows additional options to be passed to tune2fs,
> such as -m to control the amount of space reserved for root.

I'd prefer something like

IMG_POSTCMD_<fstype>

So it is generic enough to not be confusing for other filesystems.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


