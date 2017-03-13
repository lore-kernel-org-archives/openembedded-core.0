Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81E25776AF;
	Mon, 13 Mar 2017 07:42:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2D7gkUZ013665
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 00:42:46 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 00:42:45 -0700
To: akuster808 <akuster808@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <53aa1073-01e3-8315-cac6-ad0197a2d6c8@gmail.com>
	<1489389589.13980.25.camel@linuxfoundation.org>
	<6e22a199-0737-546b-fe53-8251f1075035@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <675afa96-2fc5-97e5-6bd1-67015e7222de@windriver.com>
Date: Mon, 13 Mar 2017 15:42:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <6e22a199-0737-546b-fe53-8251f1075035@gmail.com>
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
X-List-Received-Date: Mon, 13 Mar 2017 07:42:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/13/2017 03:37 PM, akuster808 wrote:
>
>
> On 03/13/2017 12:19 AM, Richard Purdie wrote:
>> On Mon, 2017-03-13 at 00:09 -0700, akuster808 wrote:
>>>      tmux split-window "do_terminal"
>>>       tmux new-window -n "OpenEmbedded Developer Shell" "do_terminal"
>>>       terminology -T="OpenEmbedded Developer Shell" -e do_terminal
>>>       gnome-terminal -t "OpenEmbedded Developer Shell" -x do_terminal
>>>       mate-terminal -t "OpenEmbedded Developer Shell" -x do_terminal
>>>       konsole --separate --workdir . -p tabtitle="OpenEmbedded
>>> Developer
>>> Shell" -e do_terminal
>>>       xfce4-terminal -T "OpenEmbedded Developer Shell" -e
>>> "do_terminal"
>>>       xterm -T "OpenEmbedded Developer Shell" -e do_terminal
>>>       rxvt -T "OpenEmbedded Developer Shell" -e do_terminal
>>>       tmux new -d -s devshell -n devshell "do_terminal"
>>>       screen -D -m
>> I suspect we need a:
>>
>> HOSTTOOLS_NONFATAL += "xterm rxvt tmux screen xfce4-terminal mate-
>> terminal konsole terminology gnome-terminal"
> That worked to get remove the above errors.
>
> please add:
>
> HOSTTOOLS_NONFATAL += "dircolors lesspipe"
>
> devshell comes up clean.

I met the same errors today, I have a patch now, will send it soon.

// Robert

>
> kind regards,
> Armin
>> into terminal.bbclass.
>>
>> Cheers,
>>
>> Richard
>

