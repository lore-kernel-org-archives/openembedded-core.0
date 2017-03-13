Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 607E0776C2;
	Mon, 13 Mar 2017 07:37:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 67so18180185pfg.2;
	Mon, 13 Mar 2017 00:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=hULUDeRbXzFPiShTG/AJiy/dnRp+cT8jMd6MRlFq4Rk=;
	b=nsyshaco+ftQ0a6hRuwOIPzZvBu1umDHewmAn5O0FlO7O6G/lpVc63WZrePEqjuzWl
	xNmNRIxnB/BgYSItsAmeo8zH+m+WW3DYY+27LKMvGWoseRwEhst40GK3l0qQI/eGNu26
	pYcEkfW4tCAXZhMH9WufYfaRU4Yxf+fycqA8w6LPSwlo94EYYKxUhwN3z13EUSsp0MGK
	MlpyxdUn+GIewo9DcJU7fbKElHu4xxLg556bjv1kGrSwJSHWt0DoNGUNnNb/RrudYkTN
	6RQcVx+7TCI6W9z2Kxy3cTv+BtLzZht9mupg5aJt/PFDH5OUhuIIw9ot70lTQ7huKGRL
	iFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=hULUDeRbXzFPiShTG/AJiy/dnRp+cT8jMd6MRlFq4Rk=;
	b=jiohA6/tzMfD6M5mvHWXPfJaGosfmubwHmnOSWk5QtK1HuJwErLzddqSG8ZmcJGPPR
	1qhwibgNivUlUdtE7KCzepru6G40IeADS/d1COcDh/X/q5MiDR964CR9G/nM8XPf0gms
	ULGIuVnz5VvJC/4xItdajoKGF1sHHnnwBRf4qc3vV7bOcZcShAh2zKLGXih+YR1oodWD
	YKPKNcdWnoy27AjYpStcVHKJg7nLL0xq8Dh4SeC1//nTNFqMPUwJUd1DnIjU1jC4N3D0
	ySldEqxQiamfw254Oq0wSWy7qvCuS+6/iOhfouQq9L+FL8qcIlOc3g6XgBNfipEMQlOI
	j1Uw==
X-Gm-Message-State: AMke39lNo6n4lD/Y990203VwIA2YjICOfqfDNqnth6Mn9xf0vhCSMdFYXFs5uNxeBcIZgg==
X-Received: by 10.98.158.219 with SMTP id f88mr36618737pfk.50.1489390647309;
	Mon, 13 Mar 2017 00:37:27 -0700 (PDT)
Received: from [10.162.103.9] ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	a77sm31530715pfj.1.2017.03.13.00.37.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 00:37:26 -0700 (PDT)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <53aa1073-01e3-8315-cac6-ad0197a2d6c8@gmail.com>
	<1489389589.13980.25.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <6e22a199-0737-546b-fe53-8251f1075035@gmail.com>
Date: Mon, 13 Mar 2017 00:37:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1489389589.13980.25.camel@linuxfoundation.org>
Subject: Re: devshell not working after pulling latest oe-core changes
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
X-List-Received-Date: Mon, 13 Mar 2017 07:37:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/13/2017 12:19 AM, Richard Purdie wrote:
> On Mon, 2017-03-13 at 00:09 -0700, akuster808 wrote:
>>      tmux split-window "do_terminal"
>>       tmux new-window -n "OpenEmbedded Developer Shell" "do_terminal"
>>       terminology -T="OpenEmbedded Developer Shell" -e do_terminal
>>       gnome-terminal -t "OpenEmbedded Developer Shell" -x do_terminal
>>       mate-terminal -t "OpenEmbedded Developer Shell" -x do_terminal
>>       konsole --separate --workdir . -p tabtitle="OpenEmbedded
>> Developer
>> Shell" -e do_terminal
>>       xfce4-terminal -T "OpenEmbedded Developer Shell" -e
>> "do_terminal"
>>       xterm -T "OpenEmbedded Developer Shell" -e do_terminal
>>       rxvt -T "OpenEmbedded Developer Shell" -e do_terminal
>>       tmux new -d -s devshell -n devshell "do_terminal"
>>       screen -D -m
> I suspect we need a:
>
> HOSTTOOLS_NONFATAL += "xterm rxvt tmux screen xfce4-terminal mate-
> terminal konsole terminology gnome-terminal"
That worked to get remove the above errors.

please add:

HOSTTOOLS_NONFATAL += "dircolors lesspipe"

devshell comes up clean.

kind regards,
Armin
> into terminal.bbclass.
>
> Cheers,
>
> Richard


