Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UHMyB-0000kY-Oa
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 00:26:28 +0100
Received: by mail-ob0-f181.google.com with SMTP id ni5so4683602obc.40
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Mar 2013 16:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=KrWshnusy5aaVGZpnfDw+plC+DaZhiC7GvCboO3h4xc=;
	b=XQOMSpVgAk32wNpDvA3yj91Nbgru8pqAJfQ2PtnddiwGiiQ9w6IzBvSOonZqOmdafR
	HIV0/vOPAtHrWb56aqgYcjKqcpdxqyv15OQKdCgJq2e0oGTh+DRbjEpgpjYgf9y9sCph
	Ujy8CpUV3N5fhJ9ZqHjLuG+x1ujyLp9ejAgopDBBwJzqcqBhMW1JrtnCKjPpiQcdHw2t
	51SDR5u3RwTy6S8whN1zVsTyOcDKEiDhXC1dl44BT78uaHsotvoZtDSmq6hu838sVv0r
	GTKxnw0tDog3PqANT5hNQG3z3HrCCqiJnv1hIkkVQuxc7S+DD4fb6wzXJOXOXo1WPyig
	/3ug==
MIME-Version: 1.0
X-Received: by 10.60.25.65 with SMTP id a1mr6029143oeg.40.1363561780059; Sun,
	17 Mar 2013 16:09:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sun, 17 Mar 2013 16:09:39 -0700 (PDT)
In-Reply-To: <CAJTo0LZjHG5ZPRv3A4cov-xCyePJu57HLoHJA_Scv3yc9=wunA@mail.gmail.com>
References: <1363307422-24753-1-git-send-email-jslater@windriver.com>
	<1363307422-24753-2-git-send-email-jslater@windriver.com>
	<5145098D.6080205@linux.intel.com>
	<CAJTo0LZjHG5ZPRv3A4cov-xCyePJu57HLoHJA_Scv3yc9=wunA@mail.gmail.com>
Date: Sun, 17 Mar 2013 20:09:39 -0300
X-Google-Sender-Auth: NU_hXOrYiZKMgBwM0NmA4XbvpHQ
Message-ID: <CAP9ODKocMDueS=-rVzisBGxmdC+OratNUUvPKbYe2kzB_rBLjw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
Subject: Re: [PATCH 1/1] [v2]tzcode-native & tzdata: update to 2013b versions
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
X-List-Received-Date: Sun, 17 Mar 2013 23:26:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Mar 16, 2013 at 9:12 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 16 March 2013 17:08, Saul Wold <sgw@linux.intel.com> wrote:
>> Please add a Signed-off-by: line, also please explain why the changes to
>> do_install and do_postinst, what issue are you trying to address?
>
> Those changes are bringing back code that were removed a month ago (by
> Otavio, iirc).

It'd be great to have an explanation about the changes and also those
to be done in a specific patch which is done after the version update.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


