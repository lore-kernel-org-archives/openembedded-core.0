Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1SkJZr-0003oi-3g
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 20:36:27 +0200
Received: by qcad10 with SMTP id d10so308451qca.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 11:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=DN9kxL2W1jLw5NNzg1sbtRZuu1sq6g06o2aT+fNvCKs=;
	b=CxYgYUAEsQqM0uTLDLzbPIh385IWQciwJqr+WgDH2CbRPFB/jsln4QGb8yy0zGROEw
	59VmgZXYI8iCcup7caeAyCP1PDDK+uVGoIgGsyLkTZFSgzXdVMVqydlY+9F17B+txOIy
	ymjnM7x186oSDDuo0m/cd2pmDhel6C8/Kml7qInUwbzSwmUbaWVm2s9HtmdVhfMc7WTq
	PSisaAf6tvdDMRyNrTVzWQaF+G+j805hLcRAZbf6e1OgeA+UOUoG9cxSOBOq3zIoVQHc
	xQSOc0vJz68O0A6/1KJVXsmsaI1BPT+ZdWjmsJhM0oUvN1adTdyMgpp//ric0R00uhXq
	ecvQ==
Received: by 10.229.136.144 with SMTP id r16mr958898qct.14.1340907931095;
	Thu, 28 Jun 2012 11:25:31 -0700 (PDT)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id y10sm1097981qan.9.2012.06.28.11.25.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 11:25:29 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAF1ZMEftbcYLjj-qFiXgGQysr_pnfMMonXJz25TO3+UXXj4ckQ@mail.gmail.com>
Date: Thu, 28 Jun 2012 14:19:58 -0400
In-Reply-To: <CAF1ZMEftbcYLjj-qFiXgGQysr_pnfMMonXJz25TO3+UXXj4ckQ@mail.gmail.com>
	(Dennis Yxun's message of "Thu, 28 Jun 2012 14:08:48 +0800")
Message-ID: <85obo3s3ht.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1.91 (gnu/linux)
MIME-Version: 1.0
Subject: Re: xcursor-transparent-theme-0.1.1: upstream source vanish
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
X-List-Received-Date: Thu, 28 Jun 2012 18:36:27 -0000
Content-Type: text/plain; charset=us-ascii

Hi Dennis,

On Thu, 28 Jun 2012 14:08:48 +0800 "Dennis.Yxun" <dennis.yxun@gmail.com> wrote:

>  Hit following error, seems that upstream source vanished
> either provide with another valid download url, or deprecated this package?
> any idea?
>
> Dennis
>
> ARNING: Checksum error encountered with download (will attempt other s[92/1931]
> URL: 'http://matchbox-project.org/sources/utils/xcursor-transparent-theme-0.1.1.
> smatch!
> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has md5
> fcb1fd1747066a1402eb3a when 7b0c623049d4aab20600d6473f8aab23 was expected
> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has sha
> 9e6cc99db0fc24b24fc544458d7e42dd0b2efc20bad174eb0700e634f when b26adf2d503d01299
> 220de09423be0364e9a060bf7e4 was expected
> ERROR: Fetcher failure for URL: 'http://matchbox-project.org/sources/utils/xcurs
> -0.1.1.tar.gz'. Checksum mismatch!
> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has md5
> fcb1fd1747066a1402eb3a when 7b0c623049d4aab20600d6473f8aab23 was expected
> File: '/home/dennis/oe/downloads/xcursor-transparent-theme-0.1.1.tar.gz' has sha
> 9e6cc99db0fc24b24fc544458d7e42dd0b2efc20bad174eb0700e634f when b26adf2d503d01299
> 220de09423be0364e9a060bf7e4 was expected
> ERROR: Function failed: Fetcher failure for URL: 'http://matchbox-project.org/so
> transparent-theme-0.1.1.tar.gz'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/dennis/oe/oe-core/build/tmp-eglibc/wo
> sor-transparent-theme-0.1.1-r4/temp/log.do_fetch.2231

At the moment I cannot access the svn repository (linked from
https://matchbox-project.org/get_involved.html).

The download links from https://matchbox-project.org/download.html are
broken.  https://matchbox-project.org/sources.1.html gives me an empty
page and http://handhelds.org/~mallum/downloadables/ (for older
releases) gives me a 404 code.

Nobody connected to freenode's #matchbox at the moment.

Do you know of any alternative to xcursor-transparent-theme?


Best wishes.
Mario


