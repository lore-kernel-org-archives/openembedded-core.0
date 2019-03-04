Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 02FBE7C82F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 18:52:00 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id j36so6266017qta.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 10:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZhfN8VMlq3sicj9WXcTavqE/+cGXB63iPM7IqAtif50=;
	b=ZcxJ7vn5tWKwypUiip//gOIMCL1rS3aiu3RT+/qgRbcVTsg9MaaRXPmCKKiF8kfp2d
	CF3LiozySINRhC9L7VGtzDgyOWQzdU72Yz1ln9JFP9wl+OVfBT8yM4AibN8+PhB+ciDe
	U6pDcpAqXa6KtJeXzLeO3+jlJSU1te2Cp3FprrHYIuft52du+zLoc19wAL+qeh51gt8y
	3DMHlx3rjthzXaS6OAakXDDrpEa+3F/ox7tnaSR1KIA5UIH6ctW7DAcVhXzVasuC5GtJ
	1eAiORmHHFdjBV7jKs7LOravoC/feSTHgjRtxQ8UG0d3KFnZOa30LVQxWt/vJsXzl+sY
	W0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZhfN8VMlq3sicj9WXcTavqE/+cGXB63iPM7IqAtif50=;
	b=uBPXa+ogAGEi2fvFhHIhv/Wc+3G1pPWP6DMqKlyrG5Y3yowBL9yXGca/GnZoTXYwHf
	yCEBNxVWIVKZOWDB6F8CB1ymW/oIkP/DXP5Id3enRY40e2VBqi7e6qqCAKS6BOGlV+mY
	u9iplPaNLkT3ATul8Yc/x55k3LA/zuWqUBd6o4Z+NJPTbKPPxfKyxoCx6yLr+rA2heJ5
	bJNsJLlhcRA1Mp0rUHn7EOhdIf1t47szVBO55ZJMsdPhwIFckFRg+p5m58NqjAvHeYb6
	39ilDG/wCp03L6s9x06cfHxen/OtOSXufIbHop3RYaM0nzAg+T3ILUeV9yXhFJD1t+O8
	xfeg==
X-Gm-Message-State: APjAAAXk4XSRCd0s9oCmVoBgblONOuAZWD7obfJLFFs0/gVKpcFsLPHO
	3EubdepqyOwHxBFnyc/xntNq5IGbkxcNIqz9KoQ=
X-Google-Smtp-Source: APXvYqyfwdvrYkYpEnQeo7ouj+UgZGnUEkSvET0r5PikoC8Bi92b+af8jLZ6C+HN0jKXldW2FIWiSrM9V2MhKXDDaXw=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr15265565qta.254.1551725521662;
	Mon, 04 Mar 2019 10:52:01 -0800 (PST)
MIME-Version: 1.0
References: <1551723824-5064-1-git-send-email-Aditya.Tayade@kpit.com>
In-Reply-To: <1551723824-5064-1-git-send-email-Aditya.Tayade@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Mar 2019 10:51:35 -0800
Message-ID: <CAMKF1sr9jzbgwLV0CnDodu9Q+O3LcfLhWW=5P_kSz5CuM2M4fA@mail.gmail.com>
To: Aditya Tayade <Aditya.Tayade@kpit.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][sumo][PATCH] run-ptest: supplied user inputs to add_person_cpp
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
X-List-Received-Date: Mon, 04 Mar 2019 18:52:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this should go to oe-devel ml and with right subject prefix.

On Mon, Mar 4, 2019 at 10:39 AM Aditya Tayade <Aditya.Tayade@kpit.com> wrot=
e:
>
> During protobuf-ptest execution, add_person_cpp waits for user
> inputs to write data into test.data file. Fixed this by supplying
> dummy data through standard input.
>
> Upstream-Status: Pending
>
> Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> ---
>  meta-oe/recipes-devtools/protobuf/protobuf/run-ptest | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest b/meta-=
oe/recipes-devtools/protobuf/protobuf/run-ptest
> index 7c3a8d1..dc6c83d 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/run-ptest
> @@ -8,7 +8,7 @@ for write_exe_full_path in ${DIR}/add_person_*; do
>  if [ -x "${write_exe_full_path}" ]; then
>  write_exe=3D`basename ${write_exe_full_path}`
>  echo "Generating new test file using ${write_exe}..."
> -${write_exe_full_path} "${TEST_FILE}"
> +printf "1234\nname\nname@example.com\n" | ${write_exe_full_path} "${TEST=
_FILE}"
>  RETVAL=3D$?
>  [ $RETVAL -eq 0 ] || exit $RETVAL
>
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

