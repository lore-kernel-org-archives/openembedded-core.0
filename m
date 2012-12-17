Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TkeQ9-0008RB-Np
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 18:24:06 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3640959pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 09:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=DtLaychH3t8UYA7b1f0gGGUO3HzPbZ6byiH6i6AKzhc=;
	b=lxePDIjCe7PAAxTS6F3eJhmoU2MjvOWDRjrWyYYw5g7xkhB07YKzArj2bGUhmgeocG
	377z5qBtg98pDSyWGUX0jBVXlTrmpxuPFJ+vEzaVjTiQ7kb1dfhw7WKHeS/opFAgTSgE
	HxqTMGDoSZHRnZeNLSR8kcPl0HwHsJew7xxdxnBUFykF0mP/lpI1vJX+m9dlubnx3kLq
	q5YrMBIgej2l6HO58dWirU6/0NV/vdBK4c3UlwdzmCQ37QHaQTy8hqugUbt3VFukLFZR
	/OEVfnyq5cdme3MzXVMMcGjPCswNhnAWZMVeoyRaz7pstlpGlmlPUTO9CLGB3aPGClyP
	bBcA==
MIME-Version: 1.0
Received: by 10.66.81.198 with SMTP id c6mr44096490pay.50.1355764164213; Mon,
	17 Dec 2012 09:09:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Mon, 17 Dec 2012 09:09:24 -0800 (PST)
In-Reply-To: <50CF510B.7040705@linux.intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
	<1355748923-24459-1-git-send-email-alexandru.damian@intel.com>
	<50CF510B.7040705@linux.intel.com>
Date: Mon, 17 Dec 2012 15:09:24 -0200
X-Google-Sender-Auth: OznNQ82aLjN4BnbyBY-nOMuoNSY
Message-ID: <CAP9ODKrDoJ8fSYtV0__F2m=n5tP+44RphzFCYEUM9jjXuPk6tQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: damien.lespiau@intel.com, Alex DAMIAN <alexandru.damian@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Mon, 17 Dec 2012 17:24:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 17, 2012 at 3:06 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 12/17/2012 04:55 AM, Alex DAMIAN wrote:
>> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>>
>> Adds "debugshell" command line parameter for live/install images.
>>
>> If the init live fails to find and mount a root-fs image,
>> dumps to a shell after timeout so that the developer can figure
>> what's wrong.
>>
>> Timeout defaults to 30 seconds, but it can be changed as param
>> argument.
>>
>> Prior art in Ubuntu. Also, leaving a system stale isn't good form.
>>
>> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>

One possible improvement (not for this patch but long term) is to use
initramfs-framework for this. It provides a modular system and has
some nice featues for debug and shell handling so you can say:

debug=before:udev shell=after:e2fs

Just an example. Another good thing about it is it allow for less code
duplication.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


