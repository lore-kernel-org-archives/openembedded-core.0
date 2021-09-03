Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.519.1630688818962362451
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 10:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oMLPkg/T;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z24-20020a17090acb1800b0018e87a24300so40667pjt.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Sep 2021 10:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6grV9T5SYD2bCxT2uLSCXBOXXxKZg9mdZlMRVaWcJZA=;
        b=oMLPkg/TNYTwBcOriwej99bSjc1hRx5+hhYF21mwUC7IGOgKXoTfMir4rnRxcn/jxc
         f5//9AYr2zd9Q7R7YOeq5Nvo8AwJbjbdJ/ZAUJneR8ydvMq+A5S/RXswoxG1aSG7Xs2U
         Q7Ax6zsprgIlIRQRCYYrkN8yfd8ZNSTstA1WIVyUIlvHi+QVmBSQTn2wM1FeKfl2oF6f
         hUC+oYvmo5KpGpX20xwC3jJxa8n66d+RESyUFr8d+j95yDRq0dudc7l++o4fG/qWwwq9
         XHFylNxxmuRTgn+7GXSiSRSD6c7hNH52NyT0bE7ZHmGY1YvLVDn6ZMmnjIkP2srvbtSW
         8JyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6grV9T5SYD2bCxT2uLSCXBOXXxKZg9mdZlMRVaWcJZA=;
        b=WnWDaLMBwUvBGs16ldeba+fEMbenKCDdxQy2gsFnp0c/gn9CNAainM0AgqDVcNbU+K
         SQCc9h4S1UXyHpJ8Ace/qa+M+uiochRxWFYJ//26/Ndz96zhgxp0WU55wqBMRPwkh8Eo
         yLs3ibTQ49bOCdNnYZBbBd77Mw/IoXfS5dy6sgXJnItuRDmr4FW/kUHcwaqEnNZWIDU+
         sKvnHA0Db9baqutk0JzM8PYldogazq5RKsmdSzJRDkpmRk14baWiSghe9Y2fMi00LUYF
         oBDBhRM6alq7ht4/XCmWsWW1GKWUO9HfZNA5CfiyTsbi928fSbhVt7udSrhhY8SnlQRI
         Sk9w==
X-Gm-Message-State: AOAM533VTVcjgkva40VHG5M/3vhRotmaguBHKiTxaj71ZOfU/LwiuTKj
	8oNi5cnd0i2y1aYtBJ28/hVfQMVo1+M=
X-Google-Smtp-Source: ABdhPJyIeHV5R/SRhA1rEr0X7nqsugqmEAw5P+MPe7dmksqyxaDiNkE6YAoqghgFEmH7NuWwSRJSnA==
X-Received: by 2002:a17:90a:fe0b:: with SMTP id ck11mr3565pjb.10.1630688818063;
        Fri, 03 Sep 2021 10:06:58 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:a04a:7cbf:45ce:90bf? ([2601:202:4180:a5c0:a04a:7cbf:45ce:90bf])
        by smtp.gmail.com with ESMTPSA id u6sm6735518pgr.3.2021.09.03.10.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:06:57 -0700 (PDT)
Subject: Re: [OE-core] [Dunfell][PATCH] dbus: Security fix CVE-2020-35512
To: Steve Sakoman <steve@sakoman.com>, Steve Sakoman <sakoman@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <169F5B2C7D1DE1C6.32188@lists.openembedded.org>
 <833a309d-1c8c-6a2e-e3b7-7b2152d54338@gmail.com>
 <CAGDS+nm6Z1+TXBxNaEYNFjOH8PJfOrZrn9JV01mc7k8LHp8Cpw@mail.gmail.com>
 <CAOSpxdZFZW+aKCNuPPguS55tS1eCHjxrZk-hqkZHB0M-VASxBA@mail.gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <1e2188c7-f037-1829-34d9-59368324616a@gmail.com>
Date: Fri, 3 Sep 2021 10:06:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAOSpxdZFZW+aKCNuPPguS55tS1eCHjxrZk-hqkZHB0M-VASxBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 9/2/21 7:55 PM, Steve Sakoman wrote:
> On Thu, Sep 2, 2021 at 8:38 AM Steve Sakoman <sakoman@gmail.com> wrote:
>> On Thu, Sep 2, 2021 at 8:10 AM Armin Kuster <akuster808@gmail.com> wrote:
>>> ping or did I miss a response to this patch?
>> No you didn't miss anything!
>>
>> I mistakenly stashed this patch along with your "lz4: Security Fix for
>> CVE-2021-3520" patch in a branch waiting for the lz4 equivalent to hit
>> master.
>>
>> Richard pushed the lz4 patch to master so now both patches are merged
>> and in test for dunfell.
> We're getting reproducible autobuilder ptest errors with this patch:
>
> AssertionError: Failed ptests:
> {'dbus-test': ['test/test-dbus-daemon',
>                'test/test-dbus-daemon-eavesdrop',
>                'test/test-monitor']}
Hmm. What is  odd the dbus-daemon does run on the target.

I can reproduce this locally.  will dig into

-armin

>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2179
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2460
>
> Steve
>
>>> -armin
>>>
>>> On 8/27/21 8:37 PM, Armin Kuster via lists.openembedded.org wrote:
>>>> From: Armin Kuster <akuster@mvista.com>
>>>>
>>>> Source: https://gitlab.freedesktop.org/dbu
>>>> MR: 108825
>>>> Type: Security Fix
>>>> Disposition: Backport from https://gitlab.freedesktop.org/dbus/dbus/-/commit/e75c67a28fa2bc41a8ab0de433a52355c71a8abf
>>>> ChangeID: dea9518b9c13dab66e7d553c622000b9c6e268cc
>>>> Description:
>>>>
>>>> Affects: < 1.12.20
>>>>
>>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> ---
>>>>  .../dbus/dbus/CVE-2020-35512.patch            | 301 ++++++++++++++++++
>>>>  meta/recipes-core/dbus/dbus_1.12.16.bb        |   1 +
>>>>  2 files changed, 302 insertions(+)
>>>>  create mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
>>>>
>>>> diff --git a/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch b/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
>>>> new file mode 100644
>>>> index 0000000000..27f5d58675
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/dbus/dbus/CVE-2020-35512.patch
>>>> @@ -0,0 +1,301 @@
>>>> +From 2b7948ef907669e844b52c4fa2268d6e3162a70c Mon Sep 17 00:00:00 2001
>>>> +From: Simon McVittie <smcv@collabora.com>
>>>> +Date: Tue, 30 Jun 2020 19:29:06 +0100
>>>> +Subject: [PATCH] userdb: Reference-count DBusUserInfo, DBusGroupInfo
>>>> +
>>>> +Previously, the hash table indexed by uid (or gid) took ownership of the
>>>> +single reference to the heap-allocated struct, and the hash table
>>>> +indexed by username (or group name) had a borrowed pointer to the same
>>>> +struct that exists in the other hash table.
>>>> +
>>>> +However, this can break down if you have two or more distinct usernames
>>>> +that share a numeric identifier. This is generally a bad idea, because
>>>> +the user-space model in such situations does not match the kernel-space
>>>> +reality, and in particular there is no effective kernel-level security
>>>> +boundary between such users, but it is sometimes done anyway.
>>>> +
>>>> +In this case, when the second username is looked up in the userdb, it
>>>> +overwrites (replaces) the entry in the hash table that is indexed by
>>>> +uid, freeing the DBusUserInfo. This results in both the key and the
>>>> +value in the hash table that is indexed by username becoming dangling
>>>> +pointers (use-after-free), leading to undefined behaviour, which is
>>>> +certainly not what we want to see when doing access control.
>>>> +
>>>> +An equivalent situation can occur with groups, in the rare case where
>>>> +a numeric group ID has two names (although I have not heard of this
>>>> +being done in practice).
>>>> +
>>>> +Solve this by reference-counting the data structure. There are up to
>>>> +three references in practice: one held temporarily while the lookup
>>>> +function is populating and storing it, one held by the hash table that
>>>> +is indexed by uid, and one held by the hash table that is indexed by
>>>> +name.
>>>> +
>>>> +Closes: dbus#305
>>>> +Signed-off-by: Simon McVittie <smcv@collabora.com>
>>>> +
>>>> +Upsteam-Status: Backport
>>>> +https://gitlab.freedesktop.org/dbus/dbus/-/commit/e75c67a28fa2bc41a8ab0de433a52355c71a8abf
>>>> +CVE: CVE-2020-35512
>>>> +Signed-off-by: Armin Kuster <akuster@mvista.com>
>>>> +
>>>> +---
>>>> + dbus/dbus-sysdeps-unix.h |  2 ++
>>>> + dbus/dbus-userdb-util.c  | 38 ++++++++++++++++++-----
>>>> + dbus/dbus-userdb.c       | 67 ++++++++++++++++++++++++++++++----------
>>>> + dbus/dbus-userdb.h       |  6 ++--
>>>> + 4 files changed, 86 insertions(+), 27 deletions(-)
>>>> +
>>>> +Index: dbus-1.12.16/dbus/dbus-sysdeps-unix.h
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-sysdeps-unix.h
>>>> ++++ dbus-1.12.16/dbus/dbus-sysdeps-unix.h
>>>> +@@ -105,6 +105,7 @@ typedef struct DBusGroupInfo DBusGroupIn
>>>> +  */
>>>> + struct DBusUserInfo
>>>> + {
>>>> ++  size_t      refcount;       /**< Reference count */
>>>> +   dbus_uid_t  uid;            /**< UID */
>>>> +   dbus_gid_t  primary_gid;    /**< GID */
>>>> +   dbus_gid_t *group_ids;      /**< Groups IDs, *including* above primary group */
>>>> +@@ -118,6 +119,7 @@ struct DBusUserInfo
>>>> +  */
>>>> + struct DBusGroupInfo
>>>> + {
>>>> ++  size_t      refcount;       /**< Reference count */
>>>> +   dbus_gid_t  gid;            /**< GID */
>>>> +   char       *groupname;      /**< Group name */
>>>> + };
>>>> +Index: dbus-1.12.16/dbus/dbus-userdb-util.c
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-userdb-util.c
>>>> ++++ dbus-1.12.16/dbus/dbus-userdb-util.c
>>>> +@@ -38,6 +38,15 @@
>>>> +  * @{
>>>> +  */
>>>> +
>>>> ++static DBusGroupInfo *
>>>> ++_dbus_group_info_ref (DBusGroupInfo *info)
>>>> ++{
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++  info->refcount++;
>>>> ++  return info;
>>>> ++}
>>>> ++
>>>> + /**
>>>> +  * Checks to see if the UID sent in is the console user
>>>> +  *
>>>> +@@ -240,9 +249,9 @@ _dbus_get_user_id_and_primary_group (con
>>>> +  * @param gid the group ID or #DBUS_GID_UNSET
>>>> +  * @param groupname group name or #NULL
>>>> +  * @param error error to fill in
>>>> +- * @returns the entry in the database
>>>> ++ * @returns the entry in the database (borrowed, do not free)
>>>> +  */
>>>> +-DBusGroupInfo*
>>>> ++const DBusGroupInfo*
>>>> + _dbus_user_database_lookup_group (DBusUserDatabase *db,
>>>> +                                   dbus_gid_t        gid,
>>>> +                                   const DBusString *groupname,
>>>> +@@ -287,13 +296,14 @@ _dbus_user_database_lookup_group (DBusUs
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +           return NULL;
>>>> +         }
>>>> ++      info->refcount = 1;
>>>> +
>>>> +       if (gid != DBUS_GID_UNSET)
>>>> +         {
>>>> +           if (!_dbus_group_info_fill_gid (info, gid, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_group_info_free_allocated (info);
>>>> ++              _dbus_group_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -302,7 +312,7 @@ _dbus_user_database_lookup_group (DBusUs
>>>> +           if (!_dbus_group_info_fill (info, groupname, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_group_info_free_allocated (info);
>>>> ++              _dbus_group_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -314,7 +324,7 @@ _dbus_user_database_lookup_group (DBusUs
>>>> +       if (!_dbus_hash_table_insert_uintptr (db->groups, info->gid, info))
>>>> +         {
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +-          _dbus_group_info_free_allocated (info);
>>>> ++          _dbus_group_info_unref (info);
>>>> +           return NULL;
>>>> +         }
>>>> +
>>>> +Index: dbus-1.12.16/dbus/dbus-userdb.c
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-userdb.c
>>>> ++++ dbus-1.12.16/dbus/dbus-userdb.c
>>>> +@@ -35,34 +35,57 @@
>>>> +  * @{
>>>> +  */
>>>> +
>>>> ++static DBusUserInfo *
>>>> ++_dbus_user_info_ref (DBusUserInfo *info)
>>>> ++{
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++  info->refcount++;
>>>> ++  return info;
>>>> ++}
>>>> ++
>>>> + /**
>>>> +- * Frees the given #DBusUserInfo's members with _dbus_user_info_free()
>>>> ++ * Decrements the reference count. If it reaches 0,
>>>> ++ * frees the given #DBusUserInfo's members with _dbus_user_info_free()
>>>> +  * and also calls dbus_free() on the block itself
>>>> +  *
>>>> +  * @param info the info
>>>> +  */
>>>> + void
>>>> +-_dbus_user_info_free_allocated (DBusUserInfo *info)
>>>> ++_dbus_user_info_unref (DBusUserInfo *info)
>>>> + {
>>>> +   if (info == NULL) /* hash table will pass NULL */
>>>> +     return;
>>>> +
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++
>>>> ++  if (--info->refcount > 0)
>>>> ++    return;
>>>> ++
>>>> +   _dbus_user_info_free (info);
>>>> +   dbus_free (info);
>>>> + }
>>>> +
>>>> + /**
>>>> +- * Frees the given #DBusGroupInfo's members with _dbus_group_info_free()
>>>> ++ * Decrements the reference count. If it reaches 0,
>>>> ++ * frees the given #DBusGroupInfo's members with _dbus_group_info_free()
>>>> +  * and also calls dbus_free() on the block itself
>>>> +  *
>>>> +  * @param info the info
>>>> +  */
>>>> + void
>>>> +-_dbus_group_info_free_allocated (DBusGroupInfo *info)
>>>> ++_dbus_group_info_unref (DBusGroupInfo *info)
>>>> + {
>>>> +   if (info == NULL) /* hash table will pass NULL */
>>>> +     return;
>>>> +
>>>> ++  _dbus_assert (info->refcount > 0);
>>>> ++  _dbus_assert (info->refcount < SIZE_MAX);
>>>> ++
>>>> ++  if (--info->refcount > 0)
>>>> ++    return;
>>>> ++
>>>> +   _dbus_group_info_free (info);
>>>> +   dbus_free (info);
>>>> + }
>>>> +@@ -124,7 +147,7 @@ _dbus_is_a_number (const DBusString *str
>>>> +  * @param error error to fill in
>>>> +  * @returns the entry in the database
>>>> +  */
>>>> +-DBusUserInfo*
>>>> ++const DBusUserInfo*
>>>> + _dbus_user_database_lookup (DBusUserDatabase *db,
>>>> +                             dbus_uid_t        uid,
>>>> +                             const DBusString *username,
>>>> +@@ -170,13 +193,14 @@ _dbus_user_database_lookup (DBusUserData
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +           return NULL;
>>>> +         }
>>>> ++      info->refcount = 1;
>>>> +
>>>> +       if (uid != DBUS_UID_UNSET)
>>>> +         {
>>>> +           if (!_dbus_user_info_fill_uid (info, uid, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_user_info_free_allocated (info);
>>>> ++              _dbus_user_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -185,7 +209,7 @@ _dbus_user_database_lookup (DBusUserData
>>>> +           if (!_dbus_user_info_fill (info, username, error))
>>>> +             {
>>>> +               _DBUS_ASSERT_ERROR_IS_SET (error);
>>>> +-              _dbus_user_info_free_allocated (info);
>>>> ++              _dbus_user_info_unref (info);
>>>> +               return NULL;
>>>> +             }
>>>> +         }
>>>> +@@ -198,7 +222,7 @@ _dbus_user_database_lookup (DBusUserData
>>>> +       if (!_dbus_hash_table_insert_uintptr (db->users, info->uid, info))
>>>> +         {
>>>> +           dbus_set_error (error, DBUS_ERROR_NO_MEMORY, NULL);
>>>> +-          _dbus_user_info_free_allocated (info);
>>>> ++          _dbus_user_info_unref(info);
>>>> +           return NULL;
>>>> +         }
>>>> +
>>>> +@@ -568,24 +592,24 @@ _dbus_user_database_new (void)
>>>> +   db->refcount = 1;
>>>> +
>>>> +   db->users = _dbus_hash_table_new (DBUS_HASH_UINTPTR,
>>>> +-                                    NULL, (DBusFreeFunction) _dbus_user_info_free_allocated);
>>>> ++                                    NULL, (DBusFreeFunction) _dbus_user_info_unref);
>>>> +
>>>> +   if (db->users == NULL)
>>>> +     goto failed;
>>>> +
>>>> +   db->groups = _dbus_hash_table_new (DBUS_HASH_UINTPTR,
>>>> +-                                     NULL, (DBusFreeFunction) _dbus_group_info_free_allocated);
>>>> ++                                     NULL, (DBusFreeFunction) _dbus_group_info_unref);
>>>> +
>>>> +   if (db->groups == NULL)
>>>> +     goto failed;
>>>> +
>>>> +   db->users_by_name = _dbus_hash_table_new (DBUS_HASH_STRING,
>>>> +-                                            NULL, NULL);
>>>> ++                                            NULL, (DBusFreeFunction) _dbus_user_info_unref);
>>>> +   if (db->users_by_name == NULL)
>>>> +     goto failed;
>>>> +
>>>> +   db->groups_by_name = _dbus_hash_table_new (DBUS_HASH_STRING,
>>>> +-                                             NULL, NULL);
>>>> ++                                             NULL, (DBusFreeFunction) _dbus_group_info_unref);
>>>> +   if (db->groups_by_name == NULL)
>>>> +     goto failed;
>>>> +
>>>> +Index: dbus-1.12.16/dbus/dbus-userdb.h
>>>> +===================================================================
>>>> +--- dbus-1.12.16.orig/dbus/dbus-userdb.h
>>>> ++++ dbus-1.12.16/dbus/dbus-userdb.h
>>>> +@@ -76,19 +76,19 @@ dbus_bool_t       _dbus_user_database_ge
>>>> +                                                      DBusError            *error);
>>>> +
>>>> + DBUS_PRIVATE_EXPORT
>>>> +-DBusUserInfo*  _dbus_user_database_lookup       (DBusUserDatabase *db,
>>>> ++const DBusUserInfo*  _dbus_user_database_lookup       (DBusUserDatabase *db,
>>>> +                                                  dbus_uid_t        uid,
>>>> +                                                  const DBusString *username,
>>>> +                                                  DBusError        *error);
>>>> + DBUS_PRIVATE_EXPORT
>>>> +-DBusGroupInfo* _dbus_user_database_lookup_group (DBusUserDatabase *db,
>>>> ++const DBusGroupInfo* _dbus_user_database_lookup_group (DBusUserDatabase *db,
>>>> +                                                  dbus_gid_t        gid,
>>>> +                                                  const DBusString *groupname,
>>>> +                                                  DBusError        *error);
>>>> ++
>>>> ++void            _dbus_user_info_unref    (DBusUserInfo     *info);
>>>> + DBUS_PRIVATE_EXPORT
>>>> +-void           _dbus_user_info_free_allocated   (DBusUserInfo     *info);
>>>> +-DBUS_PRIVATE_EXPORT
>>>> +-void           _dbus_group_info_free_allocated  (DBusGroupInfo    *info);
>>>> ++void           _dbus_group_info_unref           (DBusGroupInfo    *info);
>>>> + #endif /* DBUS_USERDB_INCLUDES_PRIVATE */
>>>> +
>>>> + DBUS_PRIVATE_EXPORT
>>>> diff --git a/meta/recipes-core/dbus/dbus_1.12.16.bb b/meta/recipes-core/dbus/dbus_1.12.16.bb
>>>> index 10d1b34448..13d453eb32 100644
>>>> --- a/meta/recipes-core/dbus/dbus_1.12.16.bb
>>>> +++ b/meta/recipes-core/dbus/dbus_1.12.16.bb
>>>> @@ -17,6 +17,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
>>>>             file://dbus-1.init \
>>>>             file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
>>>>             file://CVE-2020-12049.patch \
>>>> +           file://CVE-2020-35512.patch \
>>>>  "
>>>>
>>>>  SRC_URI[md5sum] = "2dbeae80dfc9e3632320c6a53d5e8890"
>>>>
>>>>
>>>>
>>>
>>>
>>>
>> 
>>

