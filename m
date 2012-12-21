Received: from mail-ob0-f171.google.com ([209.85.214.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tm6ZK-0007Zu-R2
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 18:39:41 +0100
Received: by mail-ob0-f171.google.com with SMTP id dn14so4819832obc.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Dec 2012 09:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=z4XR0UY9SAvLCVs/M5Yjg2XIssUa4s+HCf2NK0ttFlM=;
	b=K7+gTloemv6jcYg9Dy3tq7pw09SUKMDAJKnZaZqviu47YiTaeJMX9iRrowFhIA/mMN
	nvmEdEXKWIe6jIee9kHvP1gQSNgi18eLGdRoHgddPaDrxRgqOPpcvpeIW9c4ttbXue+2
	pgffXCVOIq5WUIysV+ZTgQxDxHoXIZ8FhYYrRuf+OPE87SgvZeQH+F8X6QjDpueelkev
	N62u6aSUC5U8R78ncH22CSELQajJPrCKRzfdFpdsrVJrF6hiVPRpoEC0CUPM/YnUyNG6
	8aX+fTpc5l1WUq1R0BNJ+3RBkYYbcbzc+y93IyPtKUkSDxNChCXA7HZxBWPgMSMA7Nb8
	be8g==
MIME-Version: 1.0
Received: by 10.60.171.133 with SMTP id au5mr11654964oec.90.1356110688223;
	Fri, 21 Dec 2012 09:24:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Fri, 21 Dec 2012 09:24:48 -0800 (PST)
In-Reply-To: <50D42D58.4010703@intel.com>
References: <cover.1356022882.git.radu.moisan@intel.com>
	<50D38B3E.30003@linux.intel.com> <50D42D58.4010703@intel.com>
Date: Fri, 21 Dec 2012 15:24:48 -0200
X-Google-Sender-Auth: m3nkQKaKUGAyrEg334kFkWNr8iY
Message-ID: <CAP9ODKoKLpk8THB_eWds_mSxT9f4S=rSHx5MBOjj9Cxmj8JhAg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/28][RFC] systemd Integration
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
X-List-Received-Date: Fri, 21 Dec 2012 17:39:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 21, 2012 at 7:35 AM, Radu Moisan <radu.moisan@intel.com> wrote:

>> Are you going to collapse all the systemd changes and clean up the commit
>> messages?
>>
> Wouldn't it be harder to review? I can do it anytime, if you think it is the
> right way to go.

Yes it does. Another thing it should have in commit log is the Meta-OE
revision compared so we can diff and check of more changes need to be
done.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


