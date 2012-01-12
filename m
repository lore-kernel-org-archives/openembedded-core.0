Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RlSkv-0004v7-D9
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 23:04:21 +0100
Received: by iafi7 with SMTP id i7so3468735iaf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 13:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ZKje+z8R0NRaIw8AAI4fzgBUqWIVhQdkg1Y3XFrXDtc=;
	b=BkUNUSYXNPVVZWqjUmqdZdv8ropGknc4anm5Dr59t8wDRUrtfuuhetCEqf6T0SsXEm
	8LCHGcjMGYVYPW06U2buFGCOZb1lNK2EbuZ/15EZS+oFWxtq0SJm38dYTBMagJI2ZZLL
	lrnUNIqBrW+eUwT9Erl8Mgon/pHcbhoix46x4=
MIME-Version: 1.0
Received: by 10.42.135.138 with SMTP id p10mr5360920ict.25.1326405398724; Thu,
	12 Jan 2012 13:56:38 -0800 (PST)
Received: by 10.60.34.138 with HTTP; Thu, 12 Jan 2012 13:56:38 -0800 (PST)
In-Reply-To: <4F0F46E4.1040208@linux.intel.com>
References: <1325911915-16001-4-git-send-email-steve@sakoman.com>
	<20120107141410.3d35c503@eb-e6520>
	<CAGDS+nm7EhwZUxJBiTkGa3x5R71effKqH29J2RzO81ff_kE7Rg@mail.gmail.com>
	<4F0F46E4.1040208@linux.intel.com>
Date: Thu, 12 Jan 2012 13:56:38 -0800
Message-ID: <CAGDS+nmvBbqc-GN9j-TBBTvRCu_nX-bbhHSi+6Ghu1UNNDjWcA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC v2] dhcp: package /var/lib/dhcp with dhcp-client rather than dhcp-server
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
X-List-Received-Date: Thu, 12 Jan 2012 22:04:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 12:47 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/11/2012 11:00 AM, Steve Sakoman wrote:
>>
>> On Sat, Jan 7, 2012 at 5:14 AM, Eric B=E9nard<eric@eukrea.com> =A0wrote:
>>>
>>> Hi,
>>>
>>> Le Fri, =A06 Jan 2012 20:51:54 -0800,
>>> Steve Sakoman<steve@sakoman.com> =A0a =E9crit :
>>>>
>>>> -FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-ser=
ver
>>>> ${localstatedir}/lib/dhcp/"
>>>> +FILES_dhcp-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-ser=
ver"
>>>
>>>
>>> isn't this directory necessary for dhcp-server ?
>>
>>
>> Sorry for the delay in responding! =A0I missed seeing your comment.
>>
>> Yes, both packages need this directory. =A0But the dhcp-server package
>> init already creates it if it doesn't exist:
>>
> You can still have it in the dhcp-server Package as long as the attribute=
s
> (ownership, perm, ...) are the same and it's not a symlink, so please
> include it with the FILES-dhcp-server.

In my experience you can't add an item to more than one FILES spec.

I just did the experiment of including it in both client and server
FILES, and the directory only shows up it the one that occurs first,
server in this case.

I added the directory to the client FILES in my patch because I saw
that the server init creates the directory if it doesn't exist.

I still believe that the original patch is the best way to handle this.

Steve


