Subject: Re: [PATCH 05/24] dosfstools: update 4.1 -> 4.2
To: openembedded-core@lists.openembedded.org
From: "Colin Finck" <c.finck@enlyze.com>
X-Originating-Location: Cologne, North Rhine-Westphalia, DE (212.8.141.28)
X-Originating-Platform: Windows Firefox 86
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Mar 2021 05:25:55 -0800
References: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
In-Reply-To: <CANNYZj8ynCZ5fF4=rzdAkv=yGFyOtF97WD-c5MknNON_9HMxfA@mail.gmail.com>
Message-ID: <28099.1614691555012100324@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar  1, 2021 at 05:58 PM, Alexander Kanavin wrote:
> Can you send a followup patch please, on top of master-next?

Here we go: https://lists.openembedded.org/g/openembedded-core/topic/patch=
_dosfstools_build/81024606

Who decides about backporting or not backporting dosfstools 4.2 to Dunfell=
?
I can only stress again that a large number of devices in the wild are cur=
rently running on FAT boot partitions, and come with a dosfschk version tha=
t likes to destroy these boot partitions.

Colin
