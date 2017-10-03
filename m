Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B0B9F719A7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 18:12:21 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l68so4839882wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Oct 2017 11:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vUlscPlGPwTqpq/Tmhfm80qg2g2JE+JMa4tzZKSr9+I=;
	b=N5wP3QlE2tH0Up1nEQ0Y5OjlMrlKCNKW2cnDXYpYU1TkrBnwqi7YVrcIo0Orx2ltJd
	80WIf83rz2zo7XI/Axu7MzZCw7ZzB5/1Ih0nieGBPWEN8YHQ6I2g832YAVjnmqU2QrBT
	AOSHTXhkNcK7pjXfHjKCAVLAT5S37yFDbEMt3GrWdPbBH5/AwQRwkzpUdTIO1IeTGjgT
	FvoK4ewniLwZVM4RBGDA0JeOSZvJGtkENGj5Psbpbb5b6XL2dY5T3ODkNZ3aPLck/jXQ
	2RzdquMP4W51RsyC6bN8apa6a4f7OZWDEFK6dh+aGklLy6uS+Pvu3SMpSwr34rifh3qH
	U6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vUlscPlGPwTqpq/Tmhfm80qg2g2JE+JMa4tzZKSr9+I=;
	b=jRfyWidNITPeV4YKiPqtfWc+sgKOsEeGc5hUk5BZSlZGXFuBOkYHNQhdjpum8jacBE
	usl9jtLhCDZT595boDhOJo/rV0jjCRGVE2xCxAokbAVc6wYzl9HoBv2/8ktVDg9k/7eV
	qUjKk9JZDrpWfr3GsJ/5ELwEQ2LkKyb9i17mC8AzW5NSy3inLtMCc0qsbY15yWlBlR/d
	a2EFn5yOATCgA0E/xImnHLM0ZpnltmbnAIPqc7sRu37ruQKdadfxkFlc5lNhgYLPoVax
	k9f1CywLv8+lbC7HSH1756qknYhMTJPNeeo9xKtVEE6G0ZwVWvvaI/WIHVcUTf1EWBn4
	H6cA==
X-Gm-Message-State: AMCzsaUUrYzlyDVVFa/LfcbooT6OMrrkmtAPp9aeP+y7rKcZqfr8dAm/
	TIu2xuYox2g5APNNItU9a2sfa/sPy93B2O8xm7E=
X-Google-Smtp-Source: AOwi7QAa6KsUV5RTU2bvMz2IROCtZgwHXL2K7hOKgtieiK32fRniGuzOwEBLiix6Sf6O4H+WNJDljadYLLnlmKG/2ZE=
X-Received: by 10.28.54.89 with SMTP id d86mr3590110wma.101.1507054342626;
	Tue, 03 Oct 2017 11:12:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 3 Oct 2017 11:12:22 -0700 (PDT)
In-Reply-To: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
References: <1507045133-16665-1-git-send-email-andrej.valek@siemens.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 3 Oct 2017 11:12:22 -0700
Message-ID: <CAJ86T=Xh4HZO8e-u6r9gn0nCx+ZbzkjV+AJOP3-Cgt1fF3xr7w@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] busybox updating
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Oct 2017 18:12:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 3, 2017 at 8:38 AM, Andrej Valek <andrej.valek@siemens.com> wrote:
> Update busybox to version 1.27.2
> Fix CVE-20177-5325
>
> Changes:
> - busybox: 1.24.1 -> 1.27.2:
>  - fixed link creation to shell
>   - reported bug with suid shells [https://bugs.busybox.net/show_bug.cgi?id=10346]
>  - removed and modified already merged patches
>  - updated defconfig regarding to new version

Did you compare the list of applets enabled before and after the
update? Any notable changes?

