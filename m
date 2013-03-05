Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UCpzr-0003c1-Of
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 12:25:33 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so2505077obq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 03:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=SekzCNS10ccd//Lep3skD0mOY9lZ5qjxubkIfOKNy4I=;
	b=fy7WjeMjuvo6Nnx9qjujfFX8gH4vqeMb4+cBw1AUJXD3D8vYaO+sr7SQlxYm3ST5u3
	hb/8XLquOhHW/3Qpn70bvfjnWg0GvxbG4eePD6CM9yNK/pMJQZOzQ+s7IkKrxGMMZoKF
	+D+Ssf4soNIv5Mhewub8zIDXuCGpZXSRXUAA837zflsh4vFSi8mzaiBDuX5Fk6WEqNrx
	d9a8ix5Ohi58/JYpCzywf9iUuhOP9E+gFMdTb7HCRd5SMAdx+uLuP+CXkqD/fKKMG1jk
	xKPXJAlV1JvvrueJkQGrEeIZaOSOeGaZwKuPxnJaoAsVZhFZJDc+BwsNjBLYuv/1nCWr
	i76A==
MIME-Version: 1.0
X-Received: by 10.182.110.33 with SMTP id hx1mr18359057obb.32.1362481738090;
	Tue, 05 Mar 2013 03:08:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Tue, 5 Mar 2013 03:08:57 -0800 (PST)
In-Reply-To: <1362440710-5636-1-git-send-email-leonardo.sandoval@freescale.com>
References: <1362440710-5636-1-git-send-email-leonardo.sandoval@freescale.com>
Date: Tue, 5 Mar 2013 08:08:57 -0300
X-Google-Sender-Auth: S3UL_A6BLxbL7d7kG2rENTOFLHg
Message-ID: <CAP9ODKqLsaVsse75A5rkj+m63=e+eY-kZ4sSema-x+=7K-VgSg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Leonardo Sandoval <leonardo.sandoval@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate.bbclass: Enclose sstate search parameter with quotes
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
X-List-Received-Date: Tue, 05 Mar 2013 11:25:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 4, 2013 at 8:45 PM, Leonardo Sandoval
<leonardo.sandoval@freescale.com> wrote:
> In case filenames have spaces, execution of the function
> sstater_install will hang, so the print parameter %s must be
> enclosed with quotes.
>
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


